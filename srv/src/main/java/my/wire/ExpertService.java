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

	private static final String EXPERT_SERVICE_NAME = "ExpertService";
	private static final String EXPERT_ENTITY = "Expert";
	
    private static final Logger LOG = CloudLoggerFactory.getLogger(ExpertService.class.getName());

    @BeforeRead(entity = EXPERT_ENTITY , serviceName = EXPERT_SERVICE_NAME)
    public BeforeReadResponse beforeReadOrders(ReadRequest req, ExtensionHelper h) {
        LOG.error("##### Expert - beforeReadOrders ########");
        return BeforeReadResponse.setSuccess().response();
    }

    @AfterRead(entity = EXPERT_ENTITY, serviceName = EXPERT_SERVICE_NAME)
    public ReadResponse afterReadOrders(ReadRequest req, ReadResponseAccessor res, ExtensionHelper h) {
        EntityData ed = res.getEntityData();
        //EntityData ex = EntityData.getBuilder(ed).addElement("amount", 1000).buildEntityData("Experts");
        EntityData ex = EntityData.getBuilder(ed).addElement("ext_id", "external id").buildEntityData(EXPERT_ENTITY);
        return ReadResponse.setSuccess().setData(ex).response();
    }

    @AfterQuery(entity = EXPERT_ENTITY, serviceName = EXPERT_SERVICE_NAME)
    public QueryResponse afterQueryOrders(QueryRequest req, QueryResponseAccessor res, ExtensionHelper h) {
        List<EntityData> dataList = res.getEntityDataList(); // original list
        List<EntityData> modifiedList = new ArrayList<EntityData>(dataList.size()); // modified list
        for (EntityData ed : dataList) {
            EntityData ex = EntityData.getBuilder(ed).addElement("ext_id", "external id").buildEntityData(EXPERT_ENTITY);
            modifiedList.add(ex);
        }
        return QueryResponse.setSuccess().setData(modifiedList).response();
    }
}