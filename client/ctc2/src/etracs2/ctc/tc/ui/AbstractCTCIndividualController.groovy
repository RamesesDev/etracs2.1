package etracs2.ctc.tc.ui

import com.rameses.rcp.common.*
import com.rameses.rcp.annotations.*
import com.rameses.osiris2.client.*
import com.rameses.osiris2.reports.*
import etracs2.tc.groovy.*


public abstract class AbstractCTCIndividualController extends AbstractCollectionController
{
    abstract def getEntitySvc();
    abstract def getCtcSvc();

    def taxpayer
    def taxpayerLookup = InvokerUtil.lookupOpener("entity\\.lookup", [:])
    def genderList = ['MALE','FEMALE']


    def next() 
    {
        if(taxpayer && taxpayer.entitytype != 'individual') 
        {
            MsgBox.err('Selected taxpayer is not an INDIVIDUAL type.')
            return;
        }

        if( !taxpayer ) 
        {
            entity.info.payer = [
                entitytype : 'individual',
                info:[:]
            ]
        }

        entity.tax = [
            basic:    0.00,
            business: 0.00,
            property: 0.00,
            salary:   0.00,
            interest: 0.00,
        ]
        entity.annualsalary = 0.00
        entity.businessgross = 0.00
        entity.propertyincome = 0.00
        return 'new'
    }

    void setTaxpayer( tp ) 
    {
        this.taxpayer = tp
        if( !entity.info.payer ) entity.info.payer = [:]

        if( !tp ) {
            entity.info.payer = [info:[:]]
        }
        else 
        {
            tp = entitySvc.open( tp.objid, tp.entitytype );
            if( !tp ) throw new Exception("Taxpayer record cannot be opened.");

            entity.info.payer.clear();
            entity.info.payer.putAll( tp );
        }
    }
    
    void calculate() 
    {
        def result = ctcSvc.calculate( entity );
        entity.tax = result.tax;
        entity.info.amount = result.total;
        entity.items = result.items;
    }

    void acceptTaxDue() 
    {
        def total = 0.00;
        if( entity.tax.business ) total += entity.tax.business;
        if( entity.tax.basic )    total += entity.tax.basic;
        if( entity.tax.salary )   total += entity.tax.salary;
        if( entity.tax.property ) total += entity.tax.property;
        if( entity.tax.interest ) total += entity.tax.interest;
        entity.info.amount = total;
    }

    def getReportName() { return 'AF0016' }
}
        
