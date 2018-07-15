TEXPORT:V11.02.00
DGX1110
RTABLES
2048
0
72
0
TT�          )                                   ������ 7�� 15 22:58:28 2018C:\Users\ADMINI~1\Desktop\gx1110_blob.sql                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       d    `$	
#G#G#A�G �T�                                     d    `$	
#G#G#A�G �TT                                      +00:00   BYTE UNUSED 2 INTERPRETED DISABLE:ALL  
METRICST
TABLE "ACT_GE_BYTEARRAY"
CREATE TABLE "ACT_GE_BYTEARRAY" ("ID_" NVARCHAR2(64), "REV_" NUMBER(*,0), "NAME_" NVARCHAR2(255), "DEPLOYMENT_ID_" NVARCHAR2(64), "BYTES_" BLOB, "GENERATED_" NUMBER(1, 0))  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "USER_TABLESPACE" LOGGING NOCOMPRESS LOB ("BYTES_") STORE AS BASICFILE  (TABLESPACE "USER_TABLESPACE" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION  NOCACHE LOGGING  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT))
INSERT INTO "ACT_GE_BYTEARRAY" ("ID_", "REV_", "NAME_", "DEPLOYMENT_ID_", "BYTES_", "GENERATED_") VALUES (:1, :2, :3, :4, :5, :6)
  � �    ��  � � q H                  BYTES_       2 �F  c o m / r l / e c p s / d i a g r a m s / O r d e r F l o w . b p m n  1n  l         �a %J %I     � �� �         $8�                     %I� �       �     � �� � � ���2      �<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:activiti="http://activiti.org/bpmn" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" typeLanguage="http://www.w3.org/2001/XMLSchema" expressionLanguage="http://www.w3.org/1999/XPath" targetNamespace="http://www.activiti.org/test">
  <process id="OrderFlow" name="订单流程" isExecutable="true">
    <startEvent id="startevent1" name="Start"></startEvent>
    <userTask id="noPaidOrder" name="未付款单">
      <extensionElements>
        <activiti:taskListener event="create" class="com.rl.ecps.utils.FlowOrderListener"></activiti:taskListener>
      </extensionElements>
    </userTask>
    <sequenceFlow id="flow1" name="提交订单" sourceRef="startevent1" targetRef="noPaidOrder"></sequenceFlow>
    <userTask id="paidOrder" name="已付款单">
      <extensionElements>
        <activiti:taskListener event="create" class="com.rl.ecps.utils.FlowOrderListener"></activiti:taskListener>
      </extensionElements>
    </userTask>
    <sequenceFlow id="flow2" name="支付" sourceRef="noPaidOrder" targetRef="paidOrder">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${outcome=='支付'}]]></conditionExpression>
    </sequenceFlow>
    <userTask id="timeoutOrder" name="超时作废单"></userTask>
    <sequenceFlow id="flow3" name="超时" sourceRef="noPaidOrder" targetRef="timeoutOrder">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${outcome=='超时作废'}]]></conditionExpression>
    </sequenceFlow>
    <userTask id="readyItemOrder" name="备货单"></userTask>
    <userTask id="userGiveUpOrder" name="用户作废单"></userTask>
    <sequenceFlow id="flow4" name="外呼成功" sourceRef="paidOrder" targetRef="readyItemOrder">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${outcome=='外呼成功'}]]></conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="flow5" name="用户作废" sourceRef="paidOrder" targetRef="userGiveUpOrder">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${outcome=='用户作废'}]]></conditionExpression>
    </sequenceFlow>
    <userTask id="getItemOrder" name="取货单"></userTask>
    <sequenceFlow id="flow6" name="备货完成" sourceRef="readyItemOrder" targetRef="getItemOrder"></sequenceFlow>
    <userTask id="sendOrder" name="配送单"></userTask>
    <sequenceFlow id="flow7" name="取货完成" sourceRef="getItemOrder" targetRef="sendOrder"></sequenceFlow>
    <userTask id="gotItemOrder" name="已收货单"></userTask>
    <sequenceFlow id="flow8" name="配送成功" sourceRef="sendOrder" targetRef="gotItemOrder">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${outcome=='配送成功'}]]></conditionExpression>
    </sequenceFlow>
    <userTask id="sendFailOrder" name="配送失败单"></userTask>
    <sequenceFlow id="flow9" name="配送失败" sourceRef="sendOrder" targetRef="sendFailOrder">
      <conditionExpression xsi:type="tFormalExpression"><![CDATA[${outcome=='配送失败'}]]></conditionExpression>
    </sequenceFlow>
    <userTask id="returnStockOrder" name="退库单"></userTask>
    <sequenceFlow id="flow10" name="退库" sourceRef="sendFailOrder" targetRef="returnStockOrder"></sequenceFlow>
    <userTask id="returnCashAuditOrder" name="退款审核单"></userTask>
    <sequenceFlow id="flow11" name="发起退款" sourceRef="returnStockOrder" targetRef="returnCashAuditOrder"></sequenceFlow>
    <sequenceFlow id="flow12" name="发起退款" sourceRef="gotItemOrder" targetRef="returnCashAuditOrder"></sequenceFlow>
    <sequenceFlow id="flow13" name="发起退款" sourceRef="userGiveUpOrder" targetRef="returnCashAuditOrder"></sequenceFlow>
    <userTask id="returnCashOrder" name="退款单"></userTask>
    <sequenceFlow id="flow14" name="通过" sourceRef="returnCashAuditOrder" targetRef="returnCashOrder"></sequenceFlow>
    <endEvent id="endevent1" name="End"></endEvent>
    <sequenceFlow id="flow15" name="退款" sourceRef="returnCashOrder" targetRef="endevent1"></sequenceFlow>
  </process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_OrderFlow">
    <bpmndi:BPMNPlane bpmnElement="OrderFlow" id="BPMNPlane_OrderFlow">
      <bpmndi:BPMNShape bpmnElement="startevent1" id="BPMNShape_startevent1">
        <omgdc:Bounds height="35.0" width="35.0" x="380.0" y="20.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="noPaidOrder" id="BPMNShape_noPaidOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="345.0" y="100.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="paidOrder" id="BPMNShape_paidOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="345.0" y="210.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="timeoutOrder" id="BPMNShape_timeoutOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="590.0" y="210.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="readyItemOrder" id="BPMNShape_readyItemOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="210.0" y="320.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="userGiveUpOrder" id="BPMNShape_userGiveUpOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="460.0" y="320.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="getItemOrder" id="BPMNShape_getItemOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="210.0" y="430.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sendOrder" id="BPMNShape_sendOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="210.0" y="540.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="gotItemOrder" id="BPMNShape_gotItemOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="418.0" y="540.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="sendFailOrder" id="BPMNShape_sendFailOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="210.0" y="650.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="returnStockOrder" id="BPMNShape_returnStockOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="210.0" y="760.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="returnCashAuditOrder" id="BPMNShape_returnCashAuditOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="328.0" y="860.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="returnCashOrder" id="BPMNShape_returnCashOrder">
        <omgdc:Bounds height="55.0" width="105.0" x="328.0" y="960.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape bpmnElement="endevent1" id="BPMNShape_endevent1">
        <omgdc:Bounds height="35.0" width="35.0" x="363.0" y="1070.0"></omgdc:Bounds>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNEdge bpmnElement="flow1" id="BPMNEdge_flow1">
        <omgdi:waypoint x="397.0" y="55.0"></omgdi:waypoint>
        <omgdi:waypoint x="397.0" y="100.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="16.0" width="64.0" x="409.0" y="69.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow2" id="BPMNEdge_flow2">
        <omgdi:waypoint x="397.0" y="155.0"></omgdi:waypoint>
        <omgdi:waypoint x="397.0" y="210.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="48.0" width="24.0" x="414.0" y="162.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow3" id="BPMNEdge_flow3">
        <omgdi:waypoint x="450.0" y="127.0"></omgdi:waypoint>
        <omgdi:waypoint x="642.0" y="127.0"></omgdi:waypoint>
        <omgdi:waypoint x="642.0" y="210.0"></omgdi:waypoint>
        <bpmndi:�BPMNLabel>
          <omgdc:Bounds height="48.0" width="24.0" x="471.0" y="190.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow4" id="BPMNEdge_flow4">
        <omgdi:waypoint x="345.0" y="237.0"></omgdi:waypoint>
        <omgdi:waypoint x="262.0" y="237.0"></omgdi:waypoint>
        <omgdi:waypoint x="262.0" y="320.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="48.0" width="48.0" x="268.0" y="180.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow5" id="BPMNEdge_flow5">
        <omgdi:waypoint x="450.0" y="237.0"></omgdi:waypoint>
        <omgdi:waypoint x="512.0" y="237.0"></omgdi:waypoint>
        <omgdi:waypoint x="512.0" y="320.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="48.0" width="48.0" x="459.0" y="250.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow6" id="BPMNEdge_flow6">
        <omgdi:waypoint x="262.0" y="375.0"></omgdi:waypoint>
        <omgdi:waypoint x="262.0" y="430.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="16.0" width="64.0" x="270.0" y="389.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow7" id="BPMNEdge_flow7">
        <omgdi:waypoint x="262.0" y="485.0"></omgdi:waypoint>
        <omgdi:waypoint x="262.0" y="540.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="16.0" width="64.0" x="270.0" y="499.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow8" id="BPMNEdge_flow8">
        <omgdi:waypoint x="315.0" y="567.0"></omgdi:waypoint>
        <omgdi:waypoint x="418.0" y="567.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="48.0" width="48.0" x="332.0" y="580.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow9" id="BPMNEdge_flow9">
        <omgdi:waypoint x="262.0" y="595.0"></omgdi:waypoint>
        <omgdi:waypoint x="262.0" y="650.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="48.0" width="48.0" x="210.0" y="602.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow10" id="BPMNEdge_flow10">
        <omgdi:waypoint x="262.0" y="705.0"></omgdi:waypoint>
        <omgdi:waypoint x="262.0" y="760.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="16.0" width="32.0" x="226.0" y="719.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow11" id="BPMNEdge_flow11">
        <omgdi:waypoint x="262.0" y="815.0"></omgdi:waypoint>
        <omgdi:waypoint x="262.0" y="887.0"></omgdi:waypoint>
        <omgdi:waypoint x="328.0" y="887.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="16.0" width="64.0" x="480.0" y="659.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow12" id="BPMNEdge_flow12">
        <omgdi:waypoint x="470.0" y="595.0"></omgdi:waypoint>
        <omgdi:waypoint x="470.0" y="888.0"></omgdi:waypoint>
        <omgdi:waypoint x="433.0" y="887.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="16.0" width="64.0" x="570.0" y="319.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow13" id="BPMNEdge_flow13">
        <omgdi:waypoint x="565.0" y="347.0"></omgdi:waypoint>
        <omgdi:waypoint x="621.0" y="347.0"></omgdi:waypoint>
        <omgdi:waypoint x="621.0" y="887.0"></omgdi:waypoint>
        <omgdi:waypoint x="433.0" y="887.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="16.0" width="64.0" x="189.0" y="850.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow14" id="BPMNEdge_flow14">
        <omgdi:waypoint x="380.0" y="915.0"></omgdi:waypoint>
        <omgdi:waypoint x="380.0" y="960.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="16.0" width="32.0" x="387.0" y="929.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge bpmnElement="flow15" id="BPMNEdge_flow15">
        <omgdi:waypoint x="380.0" y="1015.0"></omgdi:waypoint>
        <omgdi:waypoint x="380.0" y="1070.0"></omgdi:waypoint>
        <bpmndi:BPMNLabel>
          <omgdc:Bounds height="16.0" width="32.0" x="387.0" y="1029.0"></omgdc:Bounds>
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>  3 �D  c o m / r l / e c p s / d i a g r a m s / O r d e r F l o w . p n g  1v  t         �b %J %I     � �� �� �     $8�                     %I� �       �     � �� �� �� � � ���{      ��PNG

   IHDR  j  V   �V�  {�IDATx���}l[w����,L�1h�?x�Y���ؤ�/�V�	\XbZ���.�i�kB2��
qS���cD����Yڀ��Jۅޤwt�z�z��e�ڹ4mN;�|�O:����8���s>χފ���؟����S��    |K�>    �	�#   `|  @ ��   ��   0>    �G   ��  �    �#   `|  @ ��   ��   0>    �G   ��  �    �#   `|  @ �� "GӴB�����r���kFGG��� �1>�}j��Ğ�}pԇ�-[�~a���?��{�����Poo�U�FFFd, (��@$8p ���S�>&�U�޵c�����||\���rȷi�&}|a��Z�͵w���ի��M�d? P�# ���ohhhxx8���\��/��f���d? P�# i��qժU���mώ��e��)�J�� (���4CCC����'H�� !`| ǦM��7k{m��t.����  �Hp������Ύ�կ��裏�~r �p�� $�gǽ�&;>>�z���>��O� �U�� �V(r�\�gǅ����o��Ͳ�" $�#��e�٠_��Ⱦ�>�O ���@���rooo�fǅZ�r��Ą�'
 ��� T###�|�����7�~� �X�� Bu�=�<��]_���l6+��@b1>����s�sW���'N|�ci�O ��@����=�ui�rOO��'
 ��� T}}}��8���Q�T�� tgX ��d2�>r�� �3,�Pu�K��� �G ����y≮��;v�Z�r��'
 ��� T�7o�������>�n��?��( $�#�P�J�t:���q```llL���b|����g.M_����4M����b|������?���s�O ���@�4MK������Kӗ?����Ԕ� I��@���ѻ֯�G �#�G r����e����}�Ȋ+.M_���  ��Q.�W�\٩�͹�����'d?- H>�G ��E}��g��ώ���/<��?�~B ��G 28p`Ŋ;v�Z�߬��� B��@�r��z���}����>hp�4}��?���_�e?	 P�# �4M����n���>������_����C��� �0>������￿������}:ܻo�22��<�������66�O�T�}� �"�G ѢiZ�P���+V�H�������h�\�}� �.�G Q���� p�#��K�8S@�pRu�� )��D�# D
'e Q�� ��I@�1>@�pRu�� )��D�# D
'e Q�� ��I@�1>@�pRu�� )��D�# D
'e Q�� ��I@�1>@�pRu�� )��D�# D
'e Q�� ��I@�1>@�pRu�� )��D�# D
'e Q�� ��I@�1>@�pRu�� )��D���M�,��|Ω��p(�S��:>��c�	2��m̎ T�Y@�-��G�q��CJ�Goo' �$�� D]���m���H��sG�G ��| �����>V�~t>} �w �.��h�6���G �| �|��)���K�N���t�x�> �; Q�=�9Nowq�=��rW ��} �.�}������>�l\���	@�q�u퍏�[zL�A?� �p�u�-������ Z�� �ZNi�A�������h��� ,8��:�4 �N� �httT�{zz����}}}�ϛn��X,�>4 P�#�(z�g����5k�
ه �c|E���x�ͳ����������C �1>��x`ɒ%����{��}P  �G �lٲ��q����tZ�4�G `|a۷o_�t�>>� "D�ڵk�G� ���@�MMM��#�� ��� ���p �N� �i�6:::44��f���[�?w���r###|m �G ������I��|���m;~��\��f��]�lٲa��5чHً �1>0)���|~``����*sTs�{��>D�/��Ԕ� i\�ώ����y���,�V��鹕+W�J%�� r0>�.����Uʻ^ضu��O�^. ����5ccc�*U��S���77n|H����� �4MK��o�.U�3�����Ί��BJ 
b|P722���+�+�Z3�9�_m�|/�j���^: �#��\.���?^���)�k��XE�4+Ί����O����wωib�&v\[��_�8��{�>�I�}������ ����.��9��R��P�TjZ��5q�*.̉+B|�;�O������NWĩYq�(i�xU<��A���
����===�� ����������+���'�+�bv�~S�V�����я���*ĥ��X*�,��=���qZ�J�T�N| ��R��_/W��17m�r���G{�'��:S���JM�c�}-�U�(��:c�O����8wE�5-*B���fn�-��!���K��wr��J�# q�Pg�������3��%q���{��e˖ݰ�����/���=�&-�U�(��:c,7J�u�&.h�O�]��?���[>���{?��*����2[�㎉=��*U�� ĉ@�>U��4ja*�'ȋ�Μ8s���piŧ�X�Ϟ�oi�&��
}�ܱ{��J�# q�Pg�kVz����ŉŝ�ŝ���:t��_z����G�9�����L<z�����w��K��� �����/4�}����?9��;��Q�b|� N| ���<�(�����8�6�(��:c|<G-�G 
�����RA����8��3�Ƿ����@A�� ����(��:�G�G ���:c||�
Z�� ĉ@�>�ϟ���# q�Pg�������n�l����H���w=���ccc�rY�[�$�G u�����R|��-�ǽJ������qpp���W%��"�N| ���TW��!�z_�7?;�����tX��"Z>D�\�v/��Q2������Ŏ6 '> uƘ�zW��!�6�q�a����d/�g�-��7߷�G<p��>A����y�@4p�PץI��߇��,=J˞=�#,��{|�G����4mhhhddd��Hĉ@�1c����x���\&���75��~��r7����b��>zt��}��f�m�������U+u����D�{�曚������OJ�ҡM~>J��u�K_*�2��>G.f'�,�� �3��Ζ�<��Tw�����n�r{�����e/+����oc�ж����͋�	 '> uƌ�j��i�s��r�r��^��p�S���d/��6#��m�b1��,r'��� �3։.��Λ:n`��|�i"tޕ}�]-��XK��1���u�i1V�Zſ�Dq�Pg�[ǻQ�=�/ط��^޺��d/�g�-���d�|�E��׈)N| ��Xg�ݹ���~nr����}�Z����66o`�`�i1
�B.�[�~��q�P¼������G,�ۇ�~fJ���?"�8���{a�v��������~�}{�݆�t${�c�R)�N�>
 0N| �y�*h1>b�����3��"���X$"�8"� ���e*h���HDqDj��������^���D�G�@]:�>y��Z����X$"�8"� ��2�hM���_/��[W�H���#R�nӦM��_�>�ū~;�p>���t�7�G��PW*�2�[g��5q��Y���B� {�o���#R���C����菇�e/b��qDj\�iZ6{����8Hy��ԶL��ry��EC�1>"�H-���b�m�bA��[鳣>g��?.{�����#R�dbbB� 7m���){
?�d��㿖�PH�G��`�i��p>��}d�SS[��������hhh ���e/���qDj8��?����R�����'H�˂�I1>"�H-����`���#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� ����#ވ#R ��H0�8"� �.P���~+�r�@��u��H0�8"� ���D��{?4o�EG�@�u��ǅ��GL d�qDjD]G�G�1���H ��������_��;��s��H ���:?���hh�&����8"� ��gu�q%��@��u����P���"��#R ��_g<��3��9�q$qDjD��?^7�����;��"�H-����������|�#��"�H-����"��7���:�+�x#�H-����"��7���:�+�x#�H-����"��7���:�+�x#�H-�(��jOOO�~���O�y�M7�Eه,�F�1>��g�y&e�f͚B� �Ѐ�"ވ;�G Q�iڍ7���\�/_���W.�e�X�q�� �x��%K�4����;<<,���� ވ5�G ѵlٲ��~��t:�i��#:�x#�D���ۗ.]�����A�Y�x#�D�ڵk���:�x#�D��Ԕ�_�B$�FL1>�:�W	F�G��3M�FGG�����l:��M�"�箿�\ndd��UI⽀x�=�� ����}Eo�O>��۶?qb�RQ��箿[�lٰa����]V��`��7��"1>0)���|~``����*sTs�{���e�gjjJ�B�ěx�#\�7�����<��\e�r�����ʕ+K����B0ěx�S\����z���m]��Ӳ��o�Na|p�������JU��Է��͍��h��xot�#�:M�����K��姦/��b�r��/�7�Fg1>�����F������h��R�q����e/Z#������.��my��כ뺁7�xm^���f��Y�w����=���9�/M��Ď+b�U���z���[���79���/{���&��,�G u�L�ȑ����J�R�B\���UqaN\���~�=�_�.w�"N͊SWEIǫ���\V��/���鑽th�xot�#����޷ϟ�T�Jo�W���|��j����?�����w�iU�KUq�".TDY��{�uZ�J�_���M��Y$@��#/5J��rU��s��6(��?䱇~�ȩ3����Ĝ�ww�;h��RE��M��Y$@��#�Өz�箈��EE�����m��R7�R=w~iC��N��W�����&��,������׽�3��%q���{��e˖ݰ�����/���}���*U��X ���E2 �=��(�י����?�9wUl�S���o��Gn���c�{�ӳ��l��;&�X�T�_c�xot� P���j��F-���^��w�ęK�]�K+>uǚ�|��xKg5q~V�v��=��*U��X ���E2 �Yzdv��C/�{�8q��s��s��]�N�}�K/>�}��?'_ٹ����G{���z��wI�s�Wx ���E2 ���Bs�w��~��_��N��*�k,o��" ��z�
Z��X ���E2 ������TТ���&��,����稠E��M��Y$@��_�RA��ěx��H�:���E-�k,o��" ��:E-�k,o��" ����#���E2 ���M*h�_c�xot� P�����3TТ���&��,���i�����>�}W:���������T��_7=	���:=��|�Y+�˲�:�w��t�(���O��\���g�%��qC�TFg�F�w��宺z*7��TЊZ�39�.=�������zn���C��x'#ވ�x���Z� ���ZN��_cb��B����c��$�� ��q<`?;��awoQ:e������E��"Gc�ޮܒ�son�u;�7� �����L&��^��-�ǖ��dig��q'dt��;^�Ѿ��5>�`�O����ặ(�u��}��} t0	n��\�3�1����j�co��d �
�B6�u�wc�#����x���,jy�N	a��覎��݃���g�U��j�644422"�@�֑8F�������w˪�!��7�D2 �R����mv�_h>ɦ�ǔ���T�����g���B+��-���_��Լ����x"�]�n�'H�MLL�>�Pu0��r̤[�-�;����t6�7BC2 �V�r믎�ǯ����ipܭ�׮���R��m���_묾��|�}?�����م����2��>G�>��t0��52�˖����c��8�� �U�P��r�7��>Jt?�<��|��k��Ǔ/��6�_��Y�����.w�	vv!�q���o޼Y�Q�g�pѼ��x�{56s�C
|L���jpppll�{�I�q��o��^n��"-�Վ�[��<\����[�}'~��O���b���ddEx:���Z2f��c�����!���4�� L������Zn�1�5��n�[��м��;\$���x��m�f������λ�t�����<Ƀ%u�����#�X�Z��ot� L<�r��=ɥ�|�ؘz�~��F�9����������\c���n<�����B�F��_w$ ;qU�&�<��������x��H`Ҳ���޼}�ؑ��7�:^�m��q3�n?=nǟ`g"4~��RPޯF*�חv���H,���k�,�z���f��ot� L�٬�{�O�-[�}"t����ڍsz��G������?z|��q��6�x�ſȝGC�ĺ�g�-��|7o��d &J���fz��Վv�<f��m�b�Ҿ��w���H�ҵ�T*��i�mR[6k9�5.�m��Wr�yhΞw����O�}��<��r��o��m$0���Ve�F�y�
Z��-������)� �٩��x+ot� Lz{{�c3�g��"�b�_���-?V�؏�G��-�bg?�$�
�]E2 eO�F}�
Z�L8�>�?GtC���V�@��7��d &ʞ.{zzff��j/Q�*ց����r������x+ot� L�=]���'��ՎP�*ց	����6��G��x+ot� L�=]�e�њ�7�^.>���_��x��+�th�`�~1����FW)�)7ʎ��6m���������|^�ҵ�#�Ϸ��O�1>o㍮R�Sn�K�R&s댶�&S>+�[[(d/]�"8>�?���󖈷��FW)�)7ʎ���C����菇�e/ڢx��m�s��s�ǲ�������� ު�]�n��<>j����11�{!R�55�-���\�!{�E��o�⍮R����TC�+�����!Pn�7W}\�r-�ji'�J�]�ֹhI��j711���M��&�~�^���2�����e/T(�v�N��Uʝ; o
6T;Mӆ�����##?���*�$U.�ct�GCC�\V�,{�:CʹoE⍮R��xP��:��?���!��VGo�����-V��tRJ��f��7�J�s�(�pC�jH;��p� Lh�Pi���	� � �ù0��B�@{8w &4T���h����
u�v �����P���=�; *�A���s`BC�:H;��p� Lh�Pi���	� � �ù0��B�@{8w &4T���h����
u�v �����P���=�; *�A���s`BC�:H;��p� Lh�Pi���	� �� �ù0��B�@{8w &4T���h����
u�v �����P���=�; *�A���s`BC�:H;��p� Lh�Pi���	� � �ù0��B�@{8w &4T���h����
u�v �����P���=�; *�A���s`BC�:H;��p� Lh�Pi���	� � �ù0��B�@{8w &4T���h����
u�v �����P���=�; *�A���s`BC�:H;��p� Lh�Pi���	� � �ù0��B�@{8w &4T���h����
u�v ������Q��������������7�tS�X�}h@��v ����g�y&e�f͚B� �Ѐ#� �����x���t���}}}�rY��F�,�#P��,Y���P�����a�ti�H���5˖-[��ׯO�Ӛ��>"�[H;��`|�پ}�ҥK��:88ȿC��v ���\�v�څ�*�@��#� ���\755�7T��* � �����E�Pi���M�FGG�����l:��/�"�箿�\ndd�/RI*Ҿ����������F�w�'�|�mێ�81W��Y�s�_�-[�lذAM��*{q�a���	�����r>�8�Ʃ���\��>��U�ř����P� �Nځ�`|�4z7�������Uf)�z�Oϭ\��T*�^.,
i'�@�0>B�|>otӫ�w��m��՟��\X�Nځ$a|�ccc�*U��S���77n|H���M���	��	4MK��o�.U�3�����Ί����8"��H�GH022���+�+�Z3�9�_��|/�j���^:F�I;�<��� ��my��׻麁7�xm^���f��Y�w����=���9�/M��Ď+b�U���z���{���79���/{�i'�@�0>B�L&s���J��B�R�i!.��Ū�0'���|?����Z�;]�fũ�����U�ԋ��d.+Xӗ�����^:F�I;�<���������+���{�y1;_��Z��|�����?�݇Z�RU\��Qb�CFC�V�R�'�b���v yxB�)^j����8?#��mP.���c��Sg��!\��9����w�r_���G������M�?��7�yq�xkZT������v[*uC*�s�64�q��~�}�*j�v�$�OH`4ŋ�Z�s��q�8{U�=��e�nX����|�ЗMuϾI�}�*j�v�$�OH`4�r��_gj�V�<��U�mO�+n���������BLϊ+��;��c��REC�#�Nځ���		��P��Ө�>��ԋ�Μ8s���piŧ�X�Ϟ�oi�&��
���ؽ�r_���G������X�bv��C/�{�8q��s��s��]�N�}�K/>�}��?'_ٹ����G{���z��wIol4T�G�I;�<�?!��P/4�}����?���;��Q����i'�@����FC=O-j�v�$�OHPo��oSA��G��������h�qD�I;�<�?!��P�RA��G�������-*h�P㈴�v yxB��NQA��G�������Pi�� ��Hޟ��h�oRA��G�������a~��h�qD�I;�<�?!��POSA��G����g�Y?�y�nH���w=���ccc�rYv���A���A-��8"�qL{�T�>>����d�P�xT@tЍ ��PO�V~������NB~�({�X�9i΅[}��f�~GD0��(�������Ţ�c$���*0�����_���X.;�}��+�-u$*f����Mnx�U7�wDd�~��}��} �L}"�B���m�qv�l�M��ݥ�#{�X��ǖ�}�q�m?�;"�i�4mhhhddD�� �D���3z�kaVSo�^���|��r�B{���u$$>��X��ؓ�O���;"�i�'�l6;11!�@ 9"��DR�{L�N]�]~m\�|�飔�{9��Y8�K��:�	t{,K���o���z<�N{�T�d2�)�@ 	���D"=�d���f������q8O���d/�HH|&�#��oǷ��t�;"i����7o�,�( 	b��D�=��pʥ������m�y.���u$$�4:^�f���� �wD,�^,3��� $����c���T��쿺]v�>�EC�EG�9��g��[6p{�n�#��U�V�/ ��x�?�0F�9N�t\�ޗ=:�}o�~.���u$!-S����]ٓl��x}���_CM�x"a�s,�j<��������;���PѬ#�iމ��m���-��l��B.��}@����D<>:}:Ⰽ�5�n�Ij�h��Ѳ�����PS<ޟH�1�jG�)�c5_�������О��C`��[����Q,�w��y���CxG�%��R)�N�>
 l�x"a�~�
���Pь�'>�1:T�S=$0j�
Zt�8"�O{��B	���2��RqD���*�)��������^�]*�H{���C:��C�t:}����*Pѥ∴'>�1:T�S=$��أ5�o��\|���#Ҟ��3>BA�lڴix�+�[T��#��y�K��H{����zHP*�2�[g��5q��Y���B� {�iO|�� B9���&Q~��?��hhiOv�� B94M�f��)ږ��Z.hhiOv�� Bi��b�m�bA��[��T�<����\XҞ�3>BA�2MLL�=uӦ�	���W��L&=>�k�� �IM;�#D�!��i���l����LMmb�*��1:�����\.�_��D�Ҟȴ3>BA��0>>�����C)�R��Z��T�˂� �����#�C��}��(`|��=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&>;�����/,�A�U@�𖄂=`�s.��؏}�s܃��,��]���
"�I�N�8ڷ����yL:boF(��&�;���n�e�Nh� oL(��&��x��k�~79~j��3E�G �xcBA�0i�ge��������<�vp� :��#D���>zj覽�a|"��#D��������=���)�q|�W��[
"�I�>}ly9Э-V ��f��=`ґO-[z�����ظ;�Aě
"�IG>}N#������Tj�L�"�7#D��@�>:^�=�y�<����7 �x3BA�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A����z�������/����?o��b�(�� D�#D���3�ؿ|͚5�BA���:�G(��BӴo��yv\�|y___�\�}h ���
"�@�<�dɒ��x���>( 1��z��e˖-̎�ׯO�Ӛ��>" 1��z���۷/]�T������G >1>BA��n�ڵ����P������;���?�G(��&t �pҀ�="AӴ��ѡ��l6�N���¨���@.��k��XH1>B=�򍍍�c�>;>��/l�v�ĉ�JE�ҟ��
lٲeÆ�k���@��P��L�r9���z��\e�j�so�ӇH�ř����P \1>BA���c�o�x|�2K��szn�ʕ�RI�rp��zH�����*�]/lۺz��e/ g��P��ccc�*U��S���77n|H��p��zH�iZ:�~�t�R������wV�X�R��zH022���+�+�Z3�9�_m�|/�j���^: V��P���\n���>;�xS���ű�xiV�{�������/����nM�"�^��q����-}��R�&'���e/ +�G(��C�L&s���J��B�'�i!.��Ū�0'���|?����Z�;]�fũ�����U�ԋ� /+Xӗ�����^: V��P�����o�?]�N/�~�2/f��7Uk��������'���O�B\���q�"�Bl�s���,�A�1� B	��R��_/W��17m�r���G{�'��:S���JM�c�}-�U��R@�Ƅ�=$0F��4�>>΋sW�[Ӣ"���l��R�R��;�����{'�[�Tѥ��	zH`�������3��%q���{��e˖ݰ�����/���=�&-�U��R@�Ƅ�=$0F�r��_gj�V����U�mO�+n���������BLϊ+��;��c��RE�"�7&D�!�~��V�i���W� /V�;s�̥ʮå��c�g>{vV�����8?+�r��=��*Ut) �xcBA�XF��Շ^>��pq�@q�dq��������^<|r���N��s�+�>��/��]��>�1>h��	zH`����������wZ�Tѥ��	zH`��穠E�"�7&D�!A}|��
Zt) �xcBA���9*hѥ��	zH`��g��E�"�7&D�!�1>�E-�A�1� B	��q�
Zt) �xcBA�0>2>��
"���ߤ�]
� ޘP����v~���R@�Ƅ�=$0���TТK�
"���ߠ�]
� ޘP����x*R�8$��_�	� e/ +ޘP�����z�+e㱥�����B.�A�1� B	B���
�����n�hˑ��PoL(��Cc�z-�j<��ۯn�[n�ӑ�t �xcBA�ԧ�Z)�2}L��5��͛56v��맏�<��a�^: V�1� B	���d�x ���<���.��td/ +ޘP�����je����5���ml�,�&��#{� X�Ƅ�=$0��!T�,���e�}�_t) �xcBA�����@�~Rh�����e���w�ӑ�t �xcBA�#ױn�mȻ~����{y�6��w{h�K��7&D�!A�X�3�}������#ޘP���ٶV;f-<b��6��8Ǜ�?�懖�t �xcBA��+TТK�
"����TТK�
"���_��]
� ޘP��===33�k���@E�"�7&D�!A:�>y��Z���R@�Ƅ�=$��أ5�o��\|6���^: V��P���6m���,^�ۑ�����`��zHP*�2�[g��5q��Y���B� {� X1>BA�r<XwOM���F<44({� 8`|��=��4-��cb��B��kjj[&sk��C��p��zHS,��o+B��J��9{|�q����#D�!��Ą>An��5!�S�*~�ɤ��-{� �b|��=$�4mx8���>2򃩩�BLR��?FG444��e�˲���G(��#��������}(�T���CC��	R�� h-���z���V�#D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0� ��D�:�@8i@A�0�`'h��~��]،^D
oI(��&ޝ e�g?��Ͼ?�m9��G(��&-;�e�s���m�(�t�2ތP�L�������g����q0t) �xcBA�0�3>Z>��ϋ��٤㽄ˇ�C�"�7&D�����s?>�y��?4 �x?BA�0�ȧ������� B�t��ǖ�=�K�`jyz)�%� B��>�3J��� �x3BA�0��n�v�W��B��vb�;�Aě
"��N���k��]�R�w(܇�6�%�.��z�$��h��g;�m�?���Wo �f��=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�=`B' '(��&t �pҀ�= FGG������߯_�����t�M�bQ���:�G(���g�I٬Y��P(�>4 Q��z@h�v�76ώ˗/���+�˲@�1>BA��{���,Y������a� � B\�lٲ��q����tZ�4�G � B\�}���K��`pp���'�G(��׭]�va|�}  b��
"��uSSSz'��z ���z��N  NP�G$h�6:::44��f���[�?w���r###|mP����#R��P��|cccz�{��O>�¶m�O���T�,�����-[6lؠ�&zS��8	D��[g1>BA�2���|>?00p�Ss�9��ν}No���355%{�����n`|��=��{y�o�x|�2K��szn�ʕ�RI�r�y#o]��zH���^~���m]��Ӳ�+��y��G(��C������u��F��o}��7>${�b�����a|��=$�4-�N�q�T��P~j��;+V,�)�C��[W1>BA�������J�J��~��W�4�K�ڸ���ò�.��y�*�G(��C�\.���?^�����yq�"^�g��������鋻�Ŀ4�[;���W�/v��=wK�Rj��D�쥋%�F޺��
"�� ��9��R��P��wZ��5q�*.̉+B|�;�O������NWĩYq�(i�xU<��A���
����===��.��y�*�G(��C���޷ϟ�T�J?�^���������g��׏~��}��U!.U�Ŋ�Pe!��9d��i5�.��F޺�

"���hɗ��z�*�ψ��k���?��C?y�ԙ�7Wjb�h����W��K������⅂�=$0Z�Uo�����ִ�17;����T�T���/mh�������*Ut���7��U�PP��FK�ب�?&��g.��W��#�.[��%�}�ͷ}����웴�W��K������⅂�=$0Zr�Q��35qA�t�ض������������~��U!�gŕ��wL��W��K������⅂�=$�϶��;�Z8���bE�3'�\��:\Z�;�|�gg�[�8���Bo�;v��W��K������⅂�=$����Շ^>��pq�@q�dq��������^<|r���N��s�+�>��/��]���Vi��B��[W�BAA���Bs�w��~� _��N��*�T{�y�*^((��C�����]�=䍼u/D�!A��ϿM-�T{�y�*^((��C�����]�=䍼u/D�!����RA�.��F޺�

"���h�oQA�.��F޺�

"���h�STТKy-�J�7�7��U�PP���s�yg=zt�v>��lٲ�r+y#o]�zH`��7��E�r�i�{��	r�ҥ��_���I$y#o]�zH��m���PA�.塯��������}�+_��JA��[��BAA���4���-����ϥ�B��űRLE��BAA���*hѥ<�|�͍a1g�G�b�(�y�2^((��C����B5��e�ׄp���.��������d���W�9::ڸUz��q$�m,��@��/D�!���^�v�������6��r�e���C+����^{���gpp0�N��d�]Z,Ͽ��B�6�h9nrɛO�PP��a�^n�8�1�B{.]�Z������g�p
���ǯ~�Z^����W�	d*�

"����y�u�\z��[���c'!<�6^j����5�E�舎�u�F����%`�?=&%�Y��ㅂ�=$���Z�۵�(���[-�xl�C���!<��_p������E����״w��եer�m�z�{���h��Fd���

"����y'�]����ݾ{}3˽w�}9�g��K�8�5n]��n�趷��)]Z&��ڣ��[��IO S�O�PP��F�{���n϶�jyt��u�߽��T]*��)`���`��SC��w彍����A���OlZ^�.)	��d��zH`���.��,\c���W?��:8>6����,����^~���1���孱e��]��@�"�x�� B	��w����Q�qˣ7�궁��K�H�x�-3\���0��v�m�/�m|��r�I�cƼh�,+��,^x�� B	��w��e��k�:^p����BxFm�Ԏ�x�|��.����/��KK�2$ns�c�V�-�LE>�BAA��6>:}N����fM�ͻ#���E>>2��=.X��!B&k|����O�#����5�PP���ٶV;���?J㚅�ܸ�q�jl�r��U{��5��mt��}��<�.E���gr�Ԝ=�3�LE>�BAA���*h�7>�	���m�ly���nׄ����75�BAA���H�~�(�>Gt#�gG�k�����-����

"���h�/SA�.��F޺�

"�����gff����R�!o䭫x�� B	���ɓ��jG�@E�jy#o]�zH088���Gk�ߔ�z��l&���t�D��[W1>BA�lڴix�+�d��#��y�KK䍼u�#D�!A�T�dn�����a�g�rk��쥋%�F޺��
"�����{j���0�㡡Aًc䍼u�#D�!��i���� �]SS�2�[���-��y��G(��C�b���[�X� �Vz/�����e/W�7��%��P��LzGߴ�kB��U(�,�I���Z�B%y#o���zH�i��p>��}d�SS[��������hhh ���e/Q��7��q��P�G$����������yY��Z�wt�˒X�y[��#�C���a"o	��z��N�0��`� B��	&� ,"D�:�D��E��=`B'@��[��P�L�yK 
"�	� a"o	�"BA�0� L�-XD(��&t���% �z��N�0��`� B��	&� ,"D�:�D��E��=`B'@��[��P�L�yK 
"�	� a"o	�"BA�0� L�-XD(��&t���% �z��N�0��`� B��	&� ,"D�:�D��E��=`B'@��[��P�L�yK 
"�	� a"o	�"BA�0� L�-XD(��&t���% �z��N�0��`� B��	&� ,"D�:�D��E��=`��Nм��m?(�*aX�`� B�xw������;il��Xn�Z���!vX�`� B���na�.�r|l���;�4XD(��&�}��x_�}����mW�)�1XD(��&-�Gǟ�[�c��yl�O�Ub��	�"BA�0io|���-���g|lތv�,e��P�L��������J{�љ�QY,e��P�L�|�h����D�{�1U�R& �z��ϧ�n���N7�o�=�:�H V3XD(��&������}��ء��kӨ�M 
"��b>}�L�n���c9n�r��/V3XD(��&�}�(l�7������� n�����1XD(��&t���% �z��N�0��`� B��	&� ,"D�:�D��E��=`B'@��[��P�L�yK 
"��@OOO�~���O�y�M7�Eه��c�H 
"�x�g��θf͚B� �АpL	�"BA����x�ͳ����������CC�1y$ �z��X�dIc|���{���e���#XD(���,[�lav\�~}:��4M�!��<�E��=p���ۗ.]�w���A��#��� ,"D��֮]�0>�>���#XD(���MMM靀��Ah�<�E��=`B'@��[��P�G$h�6:::44��f���[�?w���r###|m�
RL��"BA�򍍍�c�>;>��/l�v�ĉ�JE�ҟ��
lٲeÆ�k������ ,"D�!S�\�����85W��������!Rq���d/���#XD(��C}v�������Uf)�z�Oϭ\��T*�^.t�G��P��4�|ޘ�R��¶��WZ�r�+�<�E��=�XW�j���ַ��q�C���� ,"D�!��i�t��ӥJu��Sӗ�Y�b9_H�<L	�"BA�������J�J��~��W�4�K�ڸ���ò��� ,"D�!A.�����ώ���yq�"^�g��������鋻�Ŀ4�[;���W�/v��=wK��Ծɉ��~�K�c�H 
"�� ��9��R��P��wZ��5q�*.̉+B|�;�O������NWĩYq�(i�xU<��A���
����===���� ,"D�!Aoo���OW����|�̋���M�Z����G?���>�Ӫ���bE\���[�2��i5�.�<�i��P���x�Q�����������A�\��#�=��GN��cv�&挱r׾���*Ut��aM�E��=$0F��4�>>΋sW�[Ӣ"���l��R�R��;�����{'�[�Tѥ��5M 
"���/6j���gęK��U��ȫ˖-�a�{�w�-C_6��{�MZ�Tѥ��5M 
"���ˍ����Z���sWŶ=�O�������>����
1=+����cb��J]*yX�`� B	��m��N�N��y�"ޙg.Uv.���k>�ٳ��-M����Y��;v��W��K%k� ,"D�!�e̮Y}��c{'wNw�?��Љ��~���'�O���+;��2q���c���WOܵ�.�c�#:�5M 
"���/4�}����?9��;��Q��K%k� ,"D�!�1>���]*yX�`� B	�����TТK%k� ,"D�!�1>���]*yX�`� B	���,��R�Ú& �zH`��oQA�.�<�i��P����8E-�T�	�"BA�0>2>bk� ,"D�!�1>�I-�T�	�"BA��g���3TТK%k� ,"D�!�1>���]*yX�`� B	���*hѥ��5M 
"���Ou������]������>S�T�	�"BA�C�닩�����5��r��&�[-�ⶥ�#v��R�Ú& �zHЩ��m"�������#ܰ�	�"BA��k�)�)����7��7�O��n��'ۼ+�K�cM�E��=$�OT��bja���[-����;z?����3����e/:�5M 
"�����N.�����݉��f�{y\�x`n�e�����?k�K�cM��"6�t������n�2�n U����^]L�;#Z����A�c���Ӳ}�j�Y�^:tk� >g>���+�FÅ_�Nc��p	,���Dub1e���5��]��Ոy������_����t�0�4��y̋;��e�D�&H`LW�S.��q˞�u����}����?=��rl�/���Ú&@��ћ����G�_�;O5}6�i^$0Ʃc�)��i��x��A7p��筋yֲ�ƚ&��E��Y���ז��cuۡ��|"O��#��'|��۬�ru�M=v����X�X�����N��8Ν��C� �~R�Վ.��{h\�p�l\�8h6o�v0��X�t����:R4��aM����r�K���0����@��qD
��+TТ$k� ~���B�ܶ��h��qH%f�8"	��H-z@�	�|�6��4-����l
t�����2���Ú&@п{�����D������	t
y�===33�k���@EH�4��>
�Ǉ�iXl�+�m�������	���ɓ��jG�@EH�4|����O������/�mc,�qm#L�`pp�/c��Ŀ)��r��L&#{��at�`� B	6m�4<��Y��#��y�K�c�H 
"���T*e2��h{k�0�r���BA�ҡØ<�E��=�x�8D��?��xhhP����<�E��=��4-��cb��B��kjj[&sk��C����<�E��=�)�����!Pn�ώ��=>����BW0y$ �z�411�O��6}M����
��e2���_�^(t�G��P��d�����GF~05�U�I�\���菆�r��~Y����<�E��="a||<��|_߇ܾ5W)��Z�O���]�b�?
"�	߭�01y$ �z��N�0��`� B��	&� ,"D�:�D��E��=`B'@��[��P�L�yK 
"�	� a"o	�"BA�0� L�-XD(��&t���% �z��N�0��`� B��	&� ,"D�:�D��E��=`B'@��[��P�L�yK 
"�	� a"o	�"BA�0�����6�����x�0h�L�`?�=�Ҷ�H�����Ɠ�����xП%4(B���41�	:�h�M51T6ƬM�/*D�f�,�ڒ�&��`zC���wM��Ď�������;�u�\����*;��}��r�ǉ��7�D��8@&�M4b����y� M��z��#db�4@a �p�H ��7�D��8@&�M4b����y� M��z��#db�4@a �p�H ��7�D��8@&�M4b����y� M��z��#db�4@a �p�H ��7�D��f<�o����6a,fC4b�/G��m�nYy՝,��L�y� M��z�����A.�p��D�������%���1�C�#A���gy�^0��0C84���5O4�/ 51!��0C8��3�r$!3b64@a �ph��c͟��k̈�� M��z�������e8��fC4b��޼vߑ_��G̃h"��3	jf����z��D�����zg�[��z��D��8@&�M4b����y� M��z��#db�4@a �p�H ��7�D��8@&�M4b����y� M��z@�����@ ��]]]���]w]*�R�Ԡ9��h"�����w��e����U?5h���1�,�k��̎.����f���4G�� M��z`��?<o޼r|�������'��<4@a ��ȂJ�q�ʕ�`в,���#yh�&�@=�-[�̟?�>D�Q~�r�<4@a ���|��R|T�D`
��h"���2��}$��z �C4b����y� M��z\,�������D"�`��)�����~b�X2��c�L�A��?�1�Po``��Mvvܰaë�79zt"�3��}�_��7�Z��~M���9�[ޓG�����xS�w��`;#/x�` �*e��x<���}����UYgΞ�C���d2Ս�\��\v�^4,]��EQ+V��p�U��z(cg�p8��g��ȍS��ŗ^\�xq:�V�.̉���f�b�{9�H��/��C�x<^̎������MK�~Uu�0'f���5�T㓔��W��lf��1�Pc``��{E.oQ^��`���T7��1yx�Yͷ���"<�}��A/O�X�>0C,�
�'N�s�1�K��~�h�B>�R?���N�܈�65s'��;^+����d2���ʵ,��ߧ+���Q�v�O���֡ͼ���݌';j�=� ͈�b�@,���_������xwRΉ7�žq�k$���^9yaǄ��%vXb�%��������Oy�SR������֡ͼ$��kޠ�-�g��[3���f�K1�P 
<�'�-����1Z�����$���h�U�Z�"v2'����E�G�����O@�X#�����֡ͼ�GQ�|a�덃f���=�����@=���<{�d.?R*{�4)�'���/L������_����q1/.�����
�i��b|1�8J�����m]�Tb������_���1�P�/�˾:������G7�f��~��~���SS���+��b�ܾ{_�}�*�R�i�Sw"�Ӈ�",θ��q��������@=(F���k*>N�3��#"'���x��::������U�w�5���FG)�x|��[��y����n�~���q��b�@1^(W���sc��Eq���u�\=���pc�ݎ��s�p�}�*�R�����0C�0[.��XA����>��,6�L}y��7�t���y�O�^bd\\���֡�U�5�8J釞j�&�@=�W�|��r�_;A^ȉ'ĩ���ҋ�rǲ�������-qn\�r뎝U�5�8J釞j�&�@=����eK��uxׁ���Զ�Զ=���?��o�~�ؖ�C�~{۞���:p��'��]+�R㈏hz��1�P��W��W��+}��;��hTq��=� M��z(P���f���~�h"��C���8y�j�8J釞j�&�@=(��3T��QJ?�T4b�@1>���-�R�����0C������(�z��1�P�3T��QJ?�T4b� ���z��1�P�ߧ�-�R�����0C��vr��lq��=� M��z(P��'�f���~�h"��C�b|<A5[��CO5@a �
��q	U~ ��Ϟ�.3~]�^T>��֡��h"��C�b�zON���+����3eֽ��]�|PխC��S�D����W�\���x̗�G4��j�&�@=(��weV�#V^�wy6����P�:�=� M��z(0��
鹮���+�Xu��'g����|��[�6����0C��똜*=V忕_�y��F_��/�[�6����0C���9Uz��#V]�w�F�}��#����uh3z��1�P����ʩ�c��uߠV4��A%�QJ?�T4b�@1��S���8:���Z�o����Eu��f�T4b�@1r�S�Ǫz�ʫ3E��TR��CO5@a �
HK`5�c�88�s#>���h"��C{�-�uU>J�3�U�q�k��J.�R�����0C�	�m���(�z��1�P�ST��QJ?�T4b�@1>�E5[��CO5@a �
���=�TS�QJ?�T4b�@0<v�B� �Tq��=� M��z(�F�6�� ޠ��[�B���֡�H��0Cz{{�{�2�����qխC��<4@a �
���P��1kWA�<V,����_u��f$�D���k��.�����K��{z�����#yh�&�@=԰,+�ch��B�W&�9�5�ݪ�ih?��h"��C�T*ߖJ����Wvv�s���Ӫۅ9A�� M��z�444d'����	��rW��B�����U7
s���1�P̲�D"�ܞL�$��$�0������g==ݱXľ��E�C$�D���app0�VW�g;����y}O�
;A�n�\���h"��|�"d"yh�&�@=��� 21o��0C8p$�L̛h"��	 ��1�G�ļi�&�@=��� 21o��0C8p$�L̛h"��	 ��1�G�ļi�&�@=��� 21o��0C8p$�L̛h"��	 ��1�G�ļi�&�@=��� 21o��0C8p$�L̛h"��	 ��1�G�ļi�&�@=��� 21o��0C8p$�L̛h"��	 ��1�G�ļi�&�@=��� 21o��0C�8p$�L̛h"��	 ��1�G�ļi�&�@=��� 21o��0C8p$�L̛h"��	 ��1�G�ļi�&�@=��� 21o��0C8p$�L̛h"��	 ��1�G�ļi�&�@=��� 21o��0C8p$�L̛h"��	 ��1�G�ļi�&�@=��� 21o��0C8p$�L̛h"��	 ��1�G�ļi�&�@=��� 21o��0C8p$�L̛h"��	 ��1�G�ļi�&�@=�����������H$;Le��
�b�d2��fU�E�y3
M��z�A�#�������aÆW7o>r��D.gf��n�7n\�j����!Rmk��7��D��4;d��x<���}����UYgΞ�C���d2U�l��Da �p��H`g�p8��g��ȍS��ŗ^\�xq:�V�#���X4b����x��/S���͛�.����4oƢ�0C8hs$��^��[��z�?X��1�m�f�LFa �p��H`YV0<q2�ˏQ^jd��E��R)ɝ�c�Ga �p��H�L&��x.�\ˢ����6��2�֮�i"���)=��p4b�=��Xl�s�Ύ+����Iq8'���Ů����^{���ߖ�a���Ħ��7[ܻ�>�INI�
�Ò;�Ǽ�&�@=�Ǒ 
<�'�-��S#B�ą�8?!.	��=�qէ����̉����e��đ�x��}������@  �Sz̛�h"��z	:;;Ϟ;�ˏ��ީK�b|r�[��Կ/���[��?�˼��BN�ω��v�/��3K~���7��D���8#��r�WG��ܘ�����l��O<��/�8~j��s1Q���w﫺�QE|Dh"���@��,��b���?嚊����%����	11>������;:w~gU�w喙�QE|Dh"���`P� i�b�P�қ���ĩ���e���;,�z�'���ƞ��q����U�G��&�@=����ݫ�Y�V1f�e_+������3��杩//��ƛn���3O����B���K�Sw�:���F���d2]]]�� +��DU?�ٲCI>�a�J�N�r��	q�bn�����ܱ���8=.>��iK�v�ܺcg�}�*�a�䡁t:U?@6�#��Ǔɤ�g1[U0�l����:�ڛ�6�ڶ����G������2|�_�oo���оC���k�]�c�!�䡁���h4��Y ����kQ�,f��W����O�|��;��hTI��$�)R�, و��C*�
�B���l��9�ْI����� �����T��g����Y�ْI~��d����4��T[�n݃>��Y�J1>���-����
�5�G��}D�����]�i]1>���-����w,@ˈ�@����HD��h]1>~@5[��#�Cz|J��#Pۚ5k��C}}}��@N1>f�f�^|l�R����w�֭[�z��g(C|�J$�h4�ͪ~"5:t��Q;�_�ƍ��K|lK|�[��w�^�o��]	���k�e���p�G�����`0�f͚+�}F�v�UW��������/V��b||�j�*������@�1�W{�Ν���ÿ������� p� >3��v|���hԾp��Iî���O����k���o��W''OQ�V)>�R���󕯭�������/�ÿ���{{{c��ݾ|�J�?I@	�#������D����&'OR͖��������D"���e����n��|���ǹT*%>:�x�j�:�I �D||Ɏ#��
������������[���gY卸SQ�[V]n���ߪw��ݖ]�_�t:���}���n���O|�|�7 �_z��w�@4��D���V1T�7�*m�jk��N�Uݸ1�fk^���v�f�˯�����>��O�����c��}�+��*��:�W���Wi����lV2���i2��U��;�Uެ�3qg��Kmc|�x]�f�-��b�țn���	 څ���Kr5S]̀�A�/�Z��f��#�D�n��jk�W]1n��5�C�/Vn��}�]����_L;��1��rz W>�#2cd,�A^lp���A��ȩDUHϦ��\���/ֻWՅ�w���z�mv;���9� 聵i�?ܑ�q���za��y�r�cJ1Q�}��S�o��K�1��Ff�\~�z������� ��Z	yI	�߼�J�2h��vfRLT�̾J�)o��j�{U^��}�F*/̸����\� 4�Z	5yUY�ލ+��Q�mq��r.���Wi;��߭��V=z�]ܗkn�}�z�lc��J��zjަ�B�T�l��!'��Ց�Wi;�B��7kp��Y�F�U����k%t ����q缪�P3ֻ����ݚ!Ub|<<�*m�jk�W+o�����ݗk^m���A�f%t ���ƙ�|a�덃f���7���ǚٱf�����^�{��G �r�V�,^�\�S�n�W����¡�T�j�I��n�{5�l�oUm����r��5 ��Jĝ������3n��m��qV=b�;�Y1]�M5[�G ���Ʃ�ٮ�)��'&k��t�H1�	�ST�E| /X+��[T�E| /X+���=�TSE| /X+��c�^)RM� �`�4�F�6�� ޠ��[�B��������&�(d��?&���[ >@|4�N�C�[Ǭ]q��X�����~խ  >zZ3euA짼�_�~��U�4 ��#�'˲"�;���,�>�qe2�C�[�٭�� �@|��J����R�~!�R��Ύv�|Zu� �7���Ά������=!�P����U(���F���Y��H�#�ۓɟd2�����������;�ؗU� |��app0�VW�g��-o�tv^�ӳ�N��� �D| �� ~G| U |�u�T�G �;�q R��X�HE| �c � ��u�T�G �;�q R��X�HE| �c � ��u�T�G �;�q R��X�HE| �c � ��u�T�G �;�q R��X�HE| �c � ��u�T�G �;�q R��X�HE| �c � ��u�T�G �;�q R5����v�x�� $`� Ռ	���i��v��  K- ��Mx�S�m�8 �,� ����o^�;���f �6b� Ռ?�X���mk��E6�q @[������>�xZ��E@�Z Ry��U�o���~� �v,� �j��GA| �XjH5g�o 0{,� �j->6>�(*�V�� ja� �����6�E P���T3~p�������w˹� 0�, ��w �w�� �\__���@8�/tuu��^w�u�TJ�S 4��`�=����-[��߯�� �F|0�,˺�k*������٬� h��?��y�������O$�� ��G �,X���W�\-�R��  � >�d˖-��Ϸ�c4����� �Y�|y)>�~" ��ȓ�d����� ��H�ǆ�߱�F�,������'���Po��ۯ@,K&�|l ����o``��Mvvܰaë�79zt"�3��}�_��7�Z��~M���9 �?�G@g�l6�www?q|"7AU֙�g�i�8�LFu� �O������������q�^��ҋ�/N�Ӫ� �A|��ǋ��2ո^ݼi�ү�n ������@w��\ޢ��C?��ڵ��n ��АeY�`���t.?Fy���-Z�R��G@C�d2���ʵ,�M�mSy/�j�ڟ&	խ  >��b���tv\����N��9���7.v���=��+'/����Kl�$6]��z����)OrJj��P8V�: ��#��P(t���\~�T#B�ą�8?!.	��=�qէ����̉����e��đ�x��}������@ ��u ��G@C���gϝ��GJe'�K�b|r�[��Կ/���[��?�˼��BN�ω��v�/��3��?� �V*F��岯��Ź111����쯟x�_<q���'f�
b�+���Wu_��� ^�V*F���k*>N�3��#"'���x��::������U�w�5���F� �`�4T���Uz��ܘ8uQ��,v|g��W���7��s�#>��=\u_��� ^�V*F�l��cqޚ:�x�ؼ3��E��x��7t~�?={Y��qqi|�[�vV�ר">��������X�R*�䅜�pB����~ ��+w,��7N��,q��ƅ ���Yu_��� ^�V����eK��uxׁ���Զ�Զ=���?��o�~�ؖ�C�~{۞���:p��'��]+�R㈏ p%c�4T���+����'g�}�Uw4��� �k%��b|<G5[�G �����T|�<K5[�G ����P1>���-�# x�Z	h�OS�� �`�4T��P�� �`�4T����">��������G �;�������}��">������49y�j��� �k%��b|<I5[�G ����P1>���-�# x�Z	h��K����|v�[V]n�Ei{Q���[ >�Z	h��ޓS�Ǫz��Uw��8\�ݔ���}Q�: ��J@C�׌�*Vݬ^ʔ�#�G ����P1u�+����+N�}��e9{��u ������RW!=�5�+.W~�޽�.Լ��ۙ�=R�: ��J@C��uLN����ʯ�.8�`ݍ4�,g_T� |���P1u�#�J�U~Ī���Uy���GI;Rz�[ >�Z	h����ʩ�c��-�V"<���|��V�: ��J@C�vDN���\����f5�68�X�Y	���u �������발*=V�#V^�����zTR�G ���А��8V~��� |��А�
�Cs]��R�M��ּW��J.�# x�Z	h���ަ�-�# x�Z	h�ST�E| /X+��[T�E| /X+���=�TSE| /X+��c�^)RM� �`�4�F�6�� ޠ��[�B��������&�(d��?&���[ >@|4�N�C�[Ǭ]q��X�����~խ  >zZ3euA짼�_�~��U�4 ��#�'˲"�;���,�>�qe2�C�[�٭�� �@|��J����R�~!�R��Ύv�|Zu� �7���Ά������=!�P����U(���F���Y��H�#�ۓɟd2�����������;�ؗU� |��app0�VW�g;����y}O�
;A�n ���T|�" ���T�a@ �9�q R��X�HE| �c � ��u�T�G �;�q R��X�HE| �c � ��u�T�G �;�q R��X�HE| �c � ��u�T�G �;�q R��X�HE| �c � ��u�T�G �;�q R��X�HE| �c � ��u�T�G �;�q R��X�HE| �c � ��u�T�G �;�q R��X�HE| �c Ռ�|���"��4,� ���J���e�XY3\ �. ���f�>�#@�Y R5�]u���s�mz� ��XgH�8�U%B�oO�@&�Z R5���5?��z �XvH�¯���M�ֶ �=V[ R�v���>�� 0�XmH�T|���u��@V[ R������NO� @�Z Ry�Ʀ~Ϛ��@&�Z R���=��|vO����q ڋu�T�; �;�q R��X�HE| �c � ��u�T�G �;�q R��X�̹��>;5�p8l_�������R��� h���{���ݟ�lٲ��~�O �4�#�9gY�5�\S�.\��Օ�fU?5 @ӈ� dx���͛W����"�P��  � >�d����r��`0hY��g h��$[�l�?���(?� �E| ����K�Q� ���@�L&c�G>� |��@*>6 ��u�ܲ,���͚5�X,�h4j%�Lf2�O ��#��b�F;2�?0�J8^�~=�� ~A|�~���K�,�18V
��:6 ��@;Y�����z�7>�������#�vwwW�2��h �
G|�6�L�������=r��D._�Μ=��'����<�w�^ջ ����=�鴝��)0�6�U!�G-�7��! @m�G m`YV�y��׮�+kÆ�g��9H~) �L�G m���SΎ7>�Bv,ծ�Ý����D"ջ ���`����gyޱ�^|����֭[�z�  Ո� f+��q�ٱT埃����� �JC|0+}}}��w9~�d[��ő���b?����w �@|0+�H��=mɎ���3ϔ6��٩z �G ��f��Slש�r��}�1@����w 0���u�d��[��͎v�{�}��'	�;
 �F|кիW��������J_�d�� L#>h]4-%�_z�����ѣ�W�� �i�G �+dϮ��m��v��R�� ��(h]��u��y릪�}�;
 �Ƣ�u�P���8xp.�c�O`��Q �4e �+�㫛_k{v<s�� W �#�����R���O�=>�q�`i��pX�� ��������V�������׮-m���G�� ��.�J��_�82����t���Ɠɤ� L#>��`�?-�q�sm̎�}�e�Y�{	 �F|0+�D��-Z���������X,�z �G ���f˟�خ?]�u���ǽ{���E ���l�[������?���ѣ�<�z�j�; �F|�K�,)>;���/�\]�hQyS�LF�� ��A:����,Ǿ����'��1��- @�G �a���,���ߺm{�=kۺu�T� �6�#�����/��,�.��/����]+WvT ;������R�T(�̂v�|�G�8xН����ݕ7��'�Y����Ͳ��5k�@G-�/�����~W �|�G s���x�fLt�D"CCC��2 ��#�9dYV__��#��pUd��Xl����q !>  �	�G   4��  �&  ��#   ����|ԧ)    IEND�B`���
CREATE INDEX "ACT_IDX_BYTEAR_DEPL" ON "ACT_GE_BYTEARRAY" ("DEPLOYMENT_ID_" )  PCTFREE 10 INITRANS 2 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "USER_TABLESPACE" LOGGING
ANALSTATS IS "ACT_GE_BYTEARRAY"
d BEGIN  DBMS_STATS.SET_INDEX_STATS(NULL,'"ACT_IDX_BYTEAR_DEPL"',NULL,NULL,NULL,2,1,1,1,1,1,0,6); END;
CALTER TABLE
��" ALTER TABLE "ACT_GE_BYTEARRAY" ADD  CHECK ( GENERATED_ IN (1,0) )  ENABLE  
ALTER TABLE "ACT_GE_BYTEARRAY" ADD  PRIMARY KEY ("ID_") USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "USER_TABLESPACE" LOGGING ENABLE
ANALSTATS TS "ACT_GE_BYTEARRAY"
[ BEGIN  DBMS_STATS.SET_TABLE_STATS(NULL,'"ACT_GE_BYTEARRAY"',NULL,NULL,NULL,2,5,168,6); END;
ANALSTATS TS "ACT_GE_BYTEARRAY"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '0032'; SREC.MAXVAL := '0033'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(E 1014120480182580000000000000000000,1034402889786240000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1w ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"ACT_GE_BYTEARRAY"','"ID_"', NULL ,NULL,NULL,2,.5,0,srec,3,6); END;  
ANALSTATS TS "ACT_GE_BYTEARRAY"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C102'; SREC.MAXVAL := 'C102'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 1,1& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1w ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"ACT_GE_BYTEARRAY"','"REV_"', NULL ,NULL,NULL,1,1,0,srec,3,6); END;  
ANALSTATS TS "ACT_GE_BYTEARRAY"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '0063006F006D002F0072006C002F0065006300700073002F0064006900610067'; SREC.MAXVAL := '0063006F006D002F0072006C002F0065006300700073002F0064006900610067'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(E 2007992904112350000000000000000000,2007992904112350000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1z ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"ACT_GE_BYTEARRAY"','"NAME_"', NULL ,NULL,NULL,2,.5,0,srec,70,6); END;  
ANALSTATS TS "ACT_GE_BYTEARRAY"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '0031'; SREC.MAXVAL := '0031'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(! 993838070578932000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 2� ); SREC.EPC := 1; DBMS_STATS.SET_COLUMN_STATS(NULL,'"ACT_GE_BYTEARRAY"','"DEPLOYMENT_ID_"', NULL ,NULL,NULL,1,.25,0,srec,3,6); END;  
ANALSTATS TS "ACT_GE_BYTEARRAY"
��w DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := NULL; SREC.MAXVAL := NULL; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 0,0& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1z ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"ACT_GE_BYTEARRAY"','"BYTES_"', NULL ,NULL,NULL,0,0,0,srec,87,6); END;  
ANALSTATS TS "ACT_GE_BYTEARRAY"
��w DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '80'; SREC.MAXVAL := '80'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 0,0& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1} ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"ACT_GE_BYTEARRAY"','"GENERATED_"', NULL ,NULL,NULL,1,1,0,srec,2,6); END;  
TABLE "EB_ITEM_CLOB"
CREATE TABLE "EB_ITEM_CLOB" ("ITEM_ID" NUMBER(11, 0), "ITEM_DESC" CLOB, "PACKING_LIST" CLOB)  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "GX1110" LOGGING NOCOMPRESS LOB ("ITEM_DESC") STORE AS BASICFILE  (TABLESPACE "GX1110" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION  NOCACHE LOGGING  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)) LOB ("PACKING_LIST") STORE AS BASICFILE  (TABLESPACE "GX1110" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION  NOCACHE LOGGING  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT))
INSERT INTO "EB_ITEM_CLOB" ("ITEM_ID", "ITEM_DESC", "PACKING_LIST") VALUES (:1, :2, :3)
   p H T p H T       	ITEM_DESC  PACKING_LIST   �+)<: �        :� #� #�  T  < p > & n b     $8�                     #�  �  �	     �      < p > & n b s p ; < i m g   s r c = " h t t p : / / l o c a l h o s t : 8 0 8 8 / e c p s - f i l e / u p l o a d / 2 0 1 8 0 6 0 5 1 8 2 5 2 3 0 4 7 1 6 8 . j p g "   w i d t h = " 2 5 6 0 "   h e i g h t = " 1 4 1 2 "   a l t = " "   / > < i m g   s r c = " h t t p : / / l o c a l h o s t : 8 0 8 8 / e c p s - f i l e / u p l o a d / 2 0 1 8 0 6 0 5 1 8 2 6 1 8 7 0 1 6 3 8 . j p g "   w i d t h = " 2 5 6 0 "   h e i g h t = " 1 4 1 2 "   a l t = " "   / > < / p >�� � < p > & n b s p ; < i m g   s r c = " h t t p : / / l o c a l h o s t : 8 0 8 8 / e c p s - f i l e / u p l o a d / 2 0 1 8 0 6 0 5 1 8 2 5 2 3 0 4 7 1 6 8 . j p g "   w i d t h = " 2 5 6 0 "   h e i g h t = " 1 4 1 2 "   a l t = " "   / > < i m g   s r c = " h t t p : / / l o c a l h o s t : 8 0 8 8 / e c p s - f i l e / u p l o a d / 2 0 1 8 0 6 0 5 1 8 2 6 1 8 7 0 1 6 3 8 . j p g "   w i d t h = " 2 5 6 0 "   h e i g h t = " 1 4 1 2 "   a l t = " "   / > < / p > �+*^\ �        :� #� #�  T  < p > < i m     $8�                     #�  � 	      �      < p > < i m g   s r c = " h t t p : / / l o c a l h o s t : 8 0 8 8 / e c p s - f i l e / u p l o a d / 2 0 1 8 0 6 0 6 1 6 2 3 3 8 6 1 4 4 5 5 . j p g "   w i d t h = " 2 5 6 0 "   h e i g h t = " 1 4 1 2 "   a l t = " "   / > & n b s p ; < / p >�� �  < p > < i m g   s r c = " h t t p : / / l o c a l h o s t : 8 0 8 8 / e c p s - f i l e / u p l o a d / 2 0 1 8 0 6 0 6 1 6 2 3 3 8 6 1 4 4 5 5 . j p g "   w i d t h = " 2 5 6 0 "   h e i g h t = " 1 4 1 2 "   a l t = " "   / > & n b s p ; < / p > �+-ZX �        k� #� #�  T  < p > < i m     $8�                     #�  �  	      �      < p > < i m g   s r c = " h t t p : / / l o c a l h o s t : 8 0 8 8 / e c p s - f i l e / u p l o a d / 2 0 1 8 0 7 1 5 2 0 2 0 1 9 9 5 7 1 8 8 . j p g "   w i d t h = " 5 6 0 "   h e i g h t = " 5 6 0 "   a l t = " "   / > & n b s p ; < / p >�� �  < p > < i m g   s r c = " h t t p : / / l o c a l h o s t : 8 0 8 8 / e c p s - f i l e / u p l o a d / 2 0 1 8 0 7 1 5 2 0 2 0 1 9 9 5 7 1 8 8 . j p g "   w i d t h = " 5 6 0 "   h e i g h t = " 5 6 0 "   a l t = " "   / > & n b s p ; < / p >��
CREATE UNIQUE INDEX "ITEMCLOB_PK" ON "EB_ITEM_CLOB" ("ITEM_ID" )  PCTFREE 10 INITRANS 2 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "GX1110" LOGGING
ANALSTATS IS "EB_ITEM_CLOB"
\ BEGIN  DBMS_STATS.SET_INDEX_STATS(NULL,'"ITEMCLOB_PK"',NULL,NULL,NULL,3,1,3,1,1,2,0,6); END;
ALTER TABLE "EB_ITEM_CLOB" ADD  CONSTRAINT "ITEMCLOB_PK" PRIMARY KEY ("ITEM_ID") USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "GX1110" LOGGING ENABLE 
ANALSTATS TS "EB_ITEM_CLOB"
V BEGIN  DBMS_STATS.SET_TABLE_STATS(NULL,'"EB_ITEM_CLOB"',NULL,NULL,NULL,3,5,91,6); END;
ANALSTATS TS "EB_ITEM_CLOB"
�� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C22B29'; SREC.MAXVAL := 'C22B2D'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(	 4240,4244& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1� ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"EB_ITEM_CLOB"','"ITEM_ID"', NULL ,NULL,NULL,3,.333333333333333,0,srec,4,6); END;  
ANALSTATS TS "EB_ITEM_CLOB"
��w DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := NULL; SREC.MAXVAL := NULL; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 0,0& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1y ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"EB_ITEM_CLOB"','"ITEM_DESC"', NULL ,NULL,NULL,0,0,0,srec,87,6); END;  
ANALSTATS TS "EB_ITEM_CLOB"
��w DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := NULL; SREC.MAXVAL := NULL; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 0,0& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1{ ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"EB_ITEM_CLOB"','"PACKING_LIST"', NULL ,NULL,NULL,0,0,3,srec,0,6); END;  
COMMENT ON COLUMN "EB_ITEM_CLOB"."ITEM_DESC" IS 
 '��Ʒ����:���ı��༭��'
COMMENT ON COLUMN "EB_ITEM_CLOB"."PACKING_LIST" IS 

 '��װ�嵥'
METRICST��������Լ������
TABLE "ACT_GE_BYTEARRAY"
ALTER TABLE "ACT_GE_BYTEARRAY" ADD CONSTRAINT "ACT_FK_BYTEARR_DEPL" FOREIGN KEY ("DEPLOYMENT_ID_") REFERENCES "ACT_RE_DEPLOYMENT" ("ID_") ENABLE NOVALIDATE
ENDTABLE
METRICET 4
METRICST����
METRICET 4
METRICSTͼ, �����������Ϳ���չ����
TABLE "ACT_GE_BYTEARRAY"
ENDTABLE
TABLE "ACT_GE_BYTEARRAY"
ANALSTATS CS "ACT_GE_BYTEARRAY" ("ID_" ) 
o BEGIN  DBMS_STATS.SET_INDEX_STATS(NULL,'"SYS_C                         "',NULL,NULL,NULL,2,1,2,1,1,1,0,6); END;
ENDTABLE
METRICET 6
METRICST�ڱ��
METRICET 6
METRICSTPost-inst procedural actions 
METRICET 6
METRICST��������Լ������
TABLE "EB_ITEM_CLOB"
ALTER TABLE "EB_ITEM_CLOB" ADD CONSTRAINT "ITEMCLOB_ITEM_FK" FOREIGN KEY ("ITEM_ID") REFERENCES "EB_ITEM" ("ITEM_ID") ENABLE NOVALIDATE
ENDTABLE
METRICET 7
METRICST����
METRICET 7
METRICSTͼ, �����������Ϳ���չ����
TABLE "EB_ITEM_CLOB"
ENDTABLE
TABLE "EB_ITEM_CLOB"
ENDTABLE
METRICET 9
METRICST�ڱ��
METRICET 9
METRICSTPost-inst procedural actions 
METRICET 9
METRICSTDeferred analyze commands 
TABLE "ACT_GE_BYTEARRAY"
ANALCOMPUTE TS "ACT_GE_BYTEARRAY" ANALYZE  TABLE "ACT_GE_BYTEARRAY"  ESTIMATE STATISTICS 
TABLE "EB_ITEM_CLOB"
ANALCOMPUTE TS "EB_ITEM_CLOB" ANALYZE  TABLE "EB_ITEM_CLOB"  ESTIMATE STATISTICS 
ENDTABLE
METRICET 11
METRICSTEnable enforce constraints 
TABLE "ACT_GE_BYTEARRAY"
ALTER TABLE "ACT_GE_BYTEARRAY" ENABLE CONSTRAINT "ACT_FK_BYTEARR_DEPL"
ENDTABLE
TABLE "EB_ITEM_CLOB"
ALTER TABLE "EB_ITEM_CLOB" ENABLE CONSTRAINT "ITEMCLOB_ITEM_FK"
ENDTABLE
METRICET 13
METRICETG0
EXIT
EXIT
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   