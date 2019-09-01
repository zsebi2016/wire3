package my.wire;

import java.util.ArrayList;
import java.util.List;

import com.sap.cloud.sdk.cloudplatform.logging.CloudLoggerFactory;
import com.sap.cloud.sdk.service.prov.api.*;
import com.sap.cloud.sdk.service.prov.api.annotations.*;
import com.sap.cloud.sdk.service.prov.api.exits.*;
import com.sap.cloud.sdk.service.prov.api.request.*;
import com.sap.cloud.sdk.service.prov.api.response.*;
import org.slf4j.*;

public class ExpertService {

    private static final Logger LOG = CloudLoggerFactory.getLogger(ExpertService.class.getName());

    @BeforeRead(entity = "Experts", serviceName = "ExpertService")
    public BeforeReadResponse beforeReadOrders(ReadRequest req, ExtensionHelper h) {
        LOG.error("##### Experts - beforeReadOrders ########");
        return BeforeReadResponse.setSuccess().response();
    }

    @AfterRead(entity = "Experts", serviceName = "ExpertService")
    public ReadResponse afterReadOrders(ReadRequest req, ReadResponseAccessor res, ExtensionHelper h) {
        EntityData ed = res.getEntityData();
        //EntityData ex = EntityData.getBuilder(ed).addElement("amount", 1000).buildEntityData("Experts");
        EntityData ex = EntityData.getBuilder(ed).addElement("ext_id", "external id").buildEntityData("Experts");
        return ReadResponse.setSuccess().setData(ex).response();
    }

    @AfterQuery(entity = "Experts", serviceName = "ExpertService")
    public QueryResponse afterQueryOrders(QueryRequest req, QueryResponseAccessor res, ExtensionHelper h) {
        List<EntityData> dataList = res.getEntityDataList(); // original list
        List<EntityData> modifiedList = new ArrayList<EntityData>(dataList.size()); // modified list
        for (EntityData ed : dataList) {
            EntityData ex = EntityData.getBuilder(ed).addElement("ext_id", "external id").buildEntityData("Experts");
            modifiedList.add(ex);
        }
        return QueryResponse.setSuccess().setData(modifiedList).response();
    }
}