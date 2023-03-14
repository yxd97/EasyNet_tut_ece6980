
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [24:0] axis_block_sigs;
wire [88:0] inst_idle_sigs;
wire [68:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~convert_axis_to_net_axis_512_U0.s_axis_tcp_data_TDATA_blk_n;
assign axis_block_sigs[1] = ~convert_axis_to_net_axis_512_1_U0.s_axis_rxread_data_TDATA_blk_n;
assign axis_block_sigs[2] = ~convert_axis_to_net_axis_512_2_U0.s_axis_txread_data_TDATA_blk_n;
assign axis_block_sigs[3] = ~convert_net_axis_to_axis_512_U0.m_axis_tcp_data_TDATA_blk_n;
assign axis_block_sigs[4] = ~convert_net_axis_to_axis_512_3_U0.m_axis_rxwrite_data_TDATA_blk_n;
assign axis_block_sigs[5] = ~convert_net_axis_to_axis_512_4_U0.m_axis_txwrite_data_TDATA_blk_n;
assign axis_block_sigs[6] = ~convert_axis_to_net_axis_512_5_U0.s_axis_tx_data_req_TDATA_blk_n;
assign axis_block_sigs[7] = ~convert_net_axis_to_axis_512_6_U0.m_axis_rx_data_rsp_TDATA_blk_n;
assign axis_block_sigs[8] = ~lookupReplyHandler_U0.s_axis_session_lup_rsp_TDATA_blk_n;
assign axis_block_sigs[9] = ~lookupReplyHandler_U0.m_axis_session_lup_req_TDATA_blk_n;
assign axis_block_sigs[10] = ~updateRequestSender_U0.m_axis_session_upd_req_TDATA_blk_n;
assign axis_block_sigs[11] = ~updateReplyHandler_U0.s_axis_session_upd_rsp_TDATA_blk_n;
assign axis_block_sigs[12] = ~txEngMemAccessBreakdown_U0.m_axis_txread_cmd_TDATA_blk_n;
assign axis_block_sigs[13] = ~rx_app_stream_if_U0.s_axis_rx_data_req_TDATA_blk_n;
assign axis_block_sigs[14] = ~rx_app_stream_if_U0.m_axis_rx_data_rsp_metadata_TDATA_blk_n;
assign axis_block_sigs[15] = ~rx_app_if_U0.s_axis_listen_port_req_TDATA_blk_n;
assign axis_block_sigs[16] = ~rx_app_if_U0.m_axis_listen_port_rsp_TDATA_blk_n;
assign axis_block_sigs[17] = ~stream_merger_appNotification_U0.m_axis_notification_TDATA_blk_n;
assign axis_block_sigs[18] = ~txAppStatusHandler_U0.s_axis_txwrite_sts_TDATA_blk_n;
assign axis_block_sigs[19] = ~tasi_metaLoader_U0.s_axis_tx_data_req_metadata_TDATA_blk_n;
assign axis_block_sigs[20] = ~tasi_metaLoader_U0.m_axis_tx_data_rsp_TDATA_blk_n;
assign axis_block_sigs[21] = ~tasi_pkg_pusher_512_U0.m_axis_txwrite_cmd_TDATA_blk_n;
assign axis_block_sigs[22] = ~tx_app_if_U0.s_axis_open_conn_req_TDATA_blk_n;
assign axis_block_sigs[23] = ~tx_app_if_U0.s_axis_close_conn_req_TDATA_blk_n;
assign axis_block_sigs[24] = ~tx_app_if_U0.m_axis_open_conn_rsp_TDATA_blk_n;

assign inst_idle_sigs[0] = entry_proc_U0.ap_idle;
assign inst_block_sigs[0] = (entry_proc_U0.ap_done & ~entry_proc_U0.ap_continue) | ~entry_proc_U0.axis_data_count_c_blk_n | ~entry_proc_U0.axis_max_data_count_c_blk_n | ~entry_proc_U0.myIpAddress_c143_blk_n;
assign inst_idle_sigs[1] = convert_axis_to_net_axis_512_U0.ap_idle;
assign inst_block_sigs[1] = (convert_axis_to_net_axis_512_U0.ap_done & ~convert_axis_to_net_axis_512_U0.ap_continue) | ~convert_axis_to_net_axis_512_U0.ipRxData_internal_blk_n;
assign inst_idle_sigs[2] = convert_axis_to_net_axis_512_1_U0.ap_idle;
assign inst_block_sigs[2] = (convert_axis_to_net_axis_512_1_U0.ap_done & ~convert_axis_to_net_axis_512_1_U0.ap_continue) | ~convert_axis_to_net_axis_512_1_U0.rxBufferReadData_internal_blk_n;
assign inst_idle_sigs[3] = convert_axis_to_net_axis_512_2_U0.ap_idle;
assign inst_block_sigs[3] = (convert_axis_to_net_axis_512_2_U0.ap_done & ~convert_axis_to_net_axis_512_2_U0.ap_continue) | ~convert_axis_to_net_axis_512_2_U0.txBufferReadData_internal_blk_n;
assign inst_idle_sigs[4] = convert_net_axis_to_axis_512_U0.ap_idle;
assign inst_block_sigs[4] = (convert_net_axis_to_axis_512_U0.ap_done & ~convert_net_axis_to_axis_512_U0.ap_continue) | ~convert_net_axis_to_axis_512_U0.ipTxData_internal_blk_n;
assign inst_idle_sigs[5] = convert_net_axis_to_axis_512_3_U0.ap_idle;
assign inst_block_sigs[5] = (convert_net_axis_to_axis_512_3_U0.ap_done & ~convert_net_axis_to_axis_512_3_U0.ap_continue) | ~convert_net_axis_to_axis_512_3_U0.rxBufferWriteData_internal_blk_n;
assign inst_idle_sigs[6] = convert_net_axis_to_axis_512_4_U0.ap_idle;
assign inst_block_sigs[6] = (convert_net_axis_to_axis_512_4_U0.ap_done & ~convert_net_axis_to_axis_512_4_U0.ap_continue) | ~convert_net_axis_to_axis_512_4_U0.txBufferWriteData_internal_blk_n;
assign inst_idle_sigs[7] = convert_axis_to_net_axis_512_5_U0.ap_idle;
assign inst_block_sigs[7] = (convert_axis_to_net_axis_512_5_U0.ap_done & ~convert_axis_to_net_axis_512_5_U0.ap_continue) | ~convert_axis_to_net_axis_512_5_U0.txDataReq_internal_blk_n;
assign inst_idle_sigs[8] = convert_net_axis_to_axis_512_6_U0.ap_idle;
assign inst_block_sigs[8] = (convert_net_axis_to_axis_512_6_U0.ap_done & ~convert_net_axis_to_axis_512_6_U0.ap_continue) | ~convert_net_axis_to_axis_512_6_U0.rxDataRsp_internal_blk_n;
assign inst_idle_sigs[9] = lookupReplyHandler_U0.ap_idle;
assign inst_block_sigs[9] = (lookupReplyHandler_U0.ap_done & ~lookupReplyHandler_U0.ap_continue) | ~lookupReplyHandler_U0.txApp2sLookup_req_blk_n | ~lookupReplyHandler_U0.rxEng2sLookup_req_blk_n | ~lookupReplyHandler_U0.slc_sessionIdFreeList_blk_n | ~lookupReplyHandler_U0.sessionInsert_req_blk_n | ~lookupReplyHandler_U0.sLookup2rxEng_rsp_blk_n | ~lookupReplyHandler_U0.sLookup2txApp_rsp_blk_n | ~lookupReplyHandler_U0.slc_sessionInsert_rsp_blk_n | ~lookupReplyHandler_U0.reverseLupInsertFifo_blk_n;
assign inst_idle_sigs[10] = updateRequestSender_U0.ap_idle;
assign inst_block_sigs[10] = (updateRequestSender_U0.ap_done & ~updateRequestSender_U0.ap_continue) | ~updateRequestSender_U0.sessionInsert_req_blk_n | ~updateRequestSender_U0.sessionDelete_req_blk_n | ~updateRequestSender_U0.slc_sessionIdFinFifo_blk_n;
assign inst_idle_sigs[11] = sessionIdManager_U0.ap_idle;
assign inst_block_sigs[11] = (sessionIdManager_U0.ap_done & ~sessionIdManager_U0.ap_continue) | ~sessionIdManager_U0.slc_sessionIdFinFifo_blk_n | ~sessionIdManager_U0.slc_sessionIdFreeList_blk_n;
assign inst_idle_sigs[12] = updateReplyHandler_U0.ap_idle;
assign inst_block_sigs[12] = (updateReplyHandler_U0.ap_done & ~updateReplyHandler_U0.ap_continue) | ~updateReplyHandler_U0.slc_sessionInsert_rsp_blk_n;
assign inst_idle_sigs[13] = reverseLookupTableInterface_U0.ap_idle;
assign inst_block_sigs[13] = (reverseLookupTableInterface_U0.ap_done & ~reverseLookupTableInterface_U0.ap_continue) | ~reverseLookupTableInterface_U0.myIpAddress_blk_n | ~reverseLookupTableInterface_U0.myIpAddress_c_blk_n | ~reverseLookupTableInterface_U0.reverseLupInsertFifo_blk_n | ~reverseLookupTableInterface_U0.stateTable2sLookup_releaseSession_blk_n | ~reverseLookupTableInterface_U0.sLookup2portTable_releasePort_blk_n | ~reverseLookupTableInterface_U0.sessionDelete_req_blk_n | ~reverseLookupTableInterface_U0.txEng2sLookup_rev_req_blk_n | ~reverseLookupTableInterface_U0.sLookup2txEng_rev_rsp_blk_n;
assign inst_idle_sigs[14] = state_table_U0.ap_idle;
assign inst_block_sigs[14] = (state_table_U0.ap_done & ~state_table_U0.ap_continue) | ~state_table_U0.txApp2stateTable_upd_req_blk_n | ~state_table_U0.stateTable2txApp_upd_rsp_blk_n | ~state_table_U0.txApp2stateTable_req_blk_n | ~state_table_U0.stateTable2txApp_rsp_blk_n | ~state_table_U0.rxEng2stateTable_upd_req_blk_n | ~state_table_U0.stateTable2sLookup_releaseSession_blk_n | ~state_table_U0.stateTable2rxEng_upd_rsp_blk_n | ~state_table_U0.timer2stateTable_releaseState_blk_n;
assign inst_idle_sigs[15] = rx_sar_table_U0.ap_idle;
assign inst_block_sigs[15] = (rx_sar_table_U0.ap_done & ~rx_sar_table_U0.ap_continue) | ~rx_sar_table_U0.txEng2rxSar_req_blk_n | ~rx_sar_table_U0.rxSar2txEng_rsp_blk_n | ~rx_sar_table_U0.rxApp2rxSar_upd_req_blk_n | ~rx_sar_table_U0.rxSar2rxApp_upd_rsp_blk_n | ~rx_sar_table_U0.rxEng2rxSar_upd_req_blk_n | ~rx_sar_table_U0.rxSar2rxEng_upd_rsp_blk_n;
assign inst_idle_sigs[16] = tx_sar_table_U0.ap_idle;
assign inst_block_sigs[16] = (tx_sar_table_U0.ap_done & ~tx_sar_table_U0.ap_continue) | ~tx_sar_table_U0.txEng2txSar_upd_req_blk_n | ~tx_sar_table_U0.txSar2txApp_ack_push_blk_n | ~tx_sar_table_U0.txSar2txEng_upd_rsp_blk_n | ~tx_sar_table_U0.txApp2txSar_push_blk_n | ~tx_sar_table_U0.rxEng2txSar_upd_req_blk_n | ~tx_sar_table_U0.txSar2rxEng_upd_rsp_blk_n;
assign inst_idle_sigs[17] = listening_port_table_U0.ap_idle;
assign inst_block_sigs[17] = (listening_port_table_U0.ap_done & ~listening_port_table_U0.ap_continue) | ~listening_port_table_U0.rxApp2portTable_listen_req_blk_n | ~listening_port_table_U0.portTable2rxApp_listen_rsp_blk_n | ~listening_port_table_U0.pt_portCheckListening_req_fifo_blk_n | ~listening_port_table_U0.pt_portCheckListening_rsp_fifo_blk_n;
assign inst_idle_sigs[18] = free_port_table_U0.ap_idle;
assign inst_block_sigs[18] = (free_port_table_U0.ap_done & ~free_port_table_U0.ap_continue) | ~free_port_table_U0.sLookup2portTable_releasePort_blk_n | ~free_port_table_U0.pt_portCheckUsed_req_fifo_blk_n | ~free_port_table_U0.pt_portCheckUsed_rsp_fifo_blk_n | ~free_port_table_U0.portTable2txApp_port_rsp_blk_n;
assign inst_idle_sigs[19] = check_in_multiplexer_U0.ap_idle;
assign inst_block_sigs[19] = (check_in_multiplexer_U0.ap_done & ~check_in_multiplexer_U0.ap_continue) | ~check_in_multiplexer_U0.rxEng2portTable_check_req_blk_n | ~check_in_multiplexer_U0.pt_portCheckListening_req_fifo_blk_n | ~check_in_multiplexer_U0.pt_dstFifo_blk_n | ~check_in_multiplexer_U0.pt_portCheckUsed_req_fifo_blk_n;
assign inst_idle_sigs[20] = check_out_multiplexer_U0.ap_idle;
assign inst_block_sigs[20] = (check_out_multiplexer_U0.ap_done & ~check_out_multiplexer_U0.ap_continue) | ~check_out_multiplexer_U0.pt_dstFifo_blk_n | ~check_out_multiplexer_U0.pt_portCheckListening_rsp_fifo_blk_n | ~check_out_multiplexer_U0.portTable2rxEng_check_rsp_blk_n | ~check_out_multiplexer_U0.pt_portCheckUsed_rsp_fifo_blk_n;
assign inst_idle_sigs[21] = stream_merger_event_U0.ap_idle;
assign inst_block_sigs[21] = (stream_merger_event_U0.ap_done & ~stream_merger_event_U0.ap_continue) | ~stream_merger_event_U0.rtTimer2eventEng_setEvent_blk_n | ~stream_merger_event_U0.timer2eventEng_setEvent_blk_n | ~stream_merger_event_U0.probeTimer2eventEng_setEvent_blk_n;
assign inst_idle_sigs[22] = retransmit_timer_U0.ap_idle;
assign inst_block_sigs[22] = (retransmit_timer_U0.ap_done & ~retransmit_timer_U0.ap_continue) | ~retransmit_timer_U0.rxEng2timer_clearRetransmitTimer_blk_n | ~retransmit_timer_U0.txEng2timer_setRetransmitTimer_blk_n | ~retransmit_timer_U0.rtTimer2eventEng_setEvent_blk_n | ~retransmit_timer_U0.rtTimer2stateTable_releaseState_blk_n | ~retransmit_timer_U0.timer2txApp_notification_blk_n | ~retransmit_timer_U0.timer2rxApp_notification_blk_n;
assign inst_idle_sigs[23] = probe_timer_U0.ap_idle;
assign inst_block_sigs[23] = (probe_timer_U0.ap_done & ~probe_timer_U0.ap_continue) | ~probe_timer_U0.txEng2timer_setProbeTimer_blk_n | ~probe_timer_U0.rxEng2timer_clearProbeTimer_blk_n | ~probe_timer_U0.probeTimer2eventEng_setEvent_blk_n;
assign inst_idle_sigs[24] = close_timer_U0.ap_idle;
assign inst_block_sigs[24] = (close_timer_U0.ap_done & ~close_timer_U0.ap_continue) | ~close_timer_U0.rxEng2timer_setCloseTimer_blk_n | ~close_timer_U0.closeTimer2stateTable_releaseState_blk_n;
assign inst_idle_sigs[25] = stream_merger_ap_uint_16_U0.ap_idle;
assign inst_block_sigs[25] = (stream_merger_ap_uint_16_U0.ap_done & ~stream_merger_ap_uint_16_U0.ap_continue) | ~stream_merger_ap_uint_16_U0.closeTimer2stateTable_releaseState_blk_n | ~stream_merger_ap_uint_16_U0.timer2stateTable_releaseState_blk_n | ~stream_merger_ap_uint_16_U0.rtTimer2stateTable_releaseState_blk_n;
assign inst_idle_sigs[26] = event_engine_U0.ap_idle;
assign inst_block_sigs[26] = (event_engine_U0.ap_done & ~event_engine_U0.ap_continue) | ~event_engine_U0.rxEng2eventEng_setEvent_blk_n | ~event_engine_U0.eventEng2ackDelay_event_blk_n | ~event_engine_U0.timer2eventEng_setEvent_blk_n | ~event_engine_U0.txApp2eventEng_setEvent_blk_n | ~event_engine_U0.ackDelayFifoReadCount_blk_n | ~event_engine_U0.ackDelayFifoWriteCount_blk_n | ~event_engine_U0.txEngFifoReadCount_blk_n;
assign inst_idle_sigs[27] = ack_delay_U0.ap_idle;
assign inst_block_sigs[27] = (ack_delay_U0.ap_done & ~ack_delay_U0.ap_continue) | ~ack_delay_U0.eventEng2ackDelay_event_blk_n | ~ack_delay_U0.ackDelayFifoReadCount_blk_n | ~ack_delay_U0.eventEng2txEng_event_blk_n | ~ack_delay_U0.ackDelayFifoWriteCount_blk_n;
assign inst_idle_sigs[28] = toe_process_ipv4_512_U0.ap_idle;
assign inst_block_sigs[28] = (toe_process_ipv4_512_U0.ap_done & ~toe_process_ipv4_512_U0.ap_continue) | ~toe_process_ipv4_512_U0.ipRxData_internal_blk_n | ~toe_process_ipv4_512_U0.rxEng_dataBuffer0_blk_n | ~toe_process_ipv4_512_U0.rx_process2dropLengthFifo_blk_n | ~toe_process_ipv4_512_U0.rxEng_ipMetaFifo_blk_n;
assign inst_idle_sigs[29] = drop_optional_ip_header_512_U0.ap_idle;
assign inst_block_sigs[29] = (drop_optional_ip_header_512_U0.ap_done & ~drop_optional_ip_header_512_U0.ap_continue) | ~drop_optional_ip_header_512_U0.rx_process2dropLengthFifo_blk_n | ~drop_optional_ip_header_512_U0.rxEng_dataBuffer0_blk_n | ~drop_optional_ip_header_512_U0.rxEng_dataBuffer4_blk_n;
assign inst_idle_sigs[30] = lshiftWordByOctet_512_2_U0.ap_idle;
assign inst_block_sigs[30] = (lshiftWordByOctet_512_2_U0.ap_done & ~lshiftWordByOctet_512_2_U0.ap_continue) | ~lshiftWordByOctet_512_2_U0.rxEng_dataBuffer5_blk_n | ~lshiftWordByOctet_512_2_U0.rxEng_dataBuffer4_blk_n;
assign inst_idle_sigs[31] = constructPseudoHeader_512_U0.ap_idle;
assign inst_block_sigs[31] = (constructPseudoHeader_512_U0.ap_done & ~constructPseudoHeader_512_U0.ap_continue) | ~constructPseudoHeader_512_U0.rxEng_ipMetaFifo_blk_n | ~constructPseudoHeader_512_U0.rxEng_pseudoHeaderFifo_blk_n;
assign inst_idle_sigs[32] = prependPseudoHeader_512_U0.ap_idle;
assign inst_block_sigs[32] = (prependPseudoHeader_512_U0.ap_done & ~prependPseudoHeader_512_U0.ap_continue) | ~prependPseudoHeader_512_U0.rxEng_pseudoHeaderFifo_blk_n | ~prependPseudoHeader_512_U0.rxEng_dataBuffer1_blk_n | ~prependPseudoHeader_512_U0.rxEng_dataBuffer5_blk_n;
assign inst_idle_sigs[33] = two_complement_subchecksums_512_11_U0.ap_idle;
assign inst_block_sigs[33] = (two_complement_subchecksums_512_11_U0.ap_done & ~two_complement_subchecksums_512_11_U0.ap_continue) | ~two_complement_subchecksums_512_11_U0.rxEng_dataBuffer1_blk_n | ~two_complement_subchecksums_512_11_U0.rxEng_dataBuffer2_blk_n | ~two_complement_subchecksums_512_11_U0.subSumFifo_blk_n;
assign inst_idle_sigs[34] = toe_check_ipv4_checksum_32_U0.ap_idle;
assign inst_block_sigs[34] = (toe_check_ipv4_checksum_32_U0.ap_done & ~toe_check_ipv4_checksum_32_U0.ap_continue) | ~toe_check_ipv4_checksum_32_U0.subSumFifo_blk_n | ~toe_check_ipv4_checksum_32_U0.rxEng_checksumValidFifo_blk_n;
assign inst_idle_sigs[35] = processPseudoHeader_512_U0.ap_idle;
assign inst_block_sigs[35] = (processPseudoHeader_512_U0.ap_done & ~processPseudoHeader_512_U0.ap_continue) | ~processPseudoHeader_512_U0.rxEng_dataBuffer2_blk_n | ~processPseudoHeader_512_U0.rxEng_checksumValidFifo_blk_n | ~processPseudoHeader_512_U0.rxEng_dataBuffer3a_blk_n | ~processPseudoHeader_512_U0.rxEng_headerMetaFifo_blk_n | ~processPseudoHeader_512_U0.rxEng2portTable_check_req_blk_n | ~processPseudoHeader_512_U0.rxEng_tupleBuffer_blk_n | ~processPseudoHeader_512_U0.rxEng_optionalFieldsMetaFifo_blk_n;
assign inst_idle_sigs[36] = rshiftWordByOctet_net_axis_512_512_3_U0.ap_idle;
assign inst_block_sigs[36] = (rshiftWordByOctet_net_axis_512_512_3_U0.ap_done & ~rshiftWordByOctet_net_axis_512_512_3_U0.ap_continue) | ~rshiftWordByOctet_net_axis_512_512_3_U0.rxEng_dataBuffer3a_blk_n | ~rshiftWordByOctet_net_axis_512_512_3_U0.rxEng_dataBuffer3b_blk_n;
assign inst_idle_sigs[37] = drop_optional_header_fields_512_U0.ap_idle;
assign inst_block_sigs[37] = (drop_optional_header_fields_512_U0.ap_done & ~drop_optional_header_fields_512_U0.ap_continue) | ~drop_optional_header_fields_512_U0.rxEng_optionalFieldsMetaFifo_blk_n | ~drop_optional_header_fields_512_U0.rxEng_dataBuffer3b_blk_n | ~drop_optional_header_fields_512_U0.rxEng_dataBuffer3_blk_n | ~drop_optional_header_fields_512_U0.rxEng_dataOffsetFifo_blk_n | ~drop_optional_header_fields_512_U0.rxEng_optionalFieldsFifo_blk_n;
assign inst_idle_sigs[38] = parse_optional_header_fields_U0.ap_idle;
assign inst_block_sigs[38] = (parse_optional_header_fields_U0.ap_done & ~parse_optional_header_fields_U0.ap_continue) | ~parse_optional_header_fields_U0.rxEng_dataOffsetFifo_blk_n | ~parse_optional_header_fields_U0.rxEng_optionalFieldsFifo_blk_n | ~parse_optional_header_fields_U0.rxEng_winScaleFifo_blk_n;
assign inst_idle_sigs[39] = merge_header_meta_U0.ap_idle;
assign inst_block_sigs[39] = (merge_header_meta_U0.ap_done & ~merge_header_meta_U0.ap_continue) | ~merge_header_meta_U0.rxEng_headerMetaFifo_blk_n | ~merge_header_meta_U0.rxEng_metaDataFifo_blk_n | ~merge_header_meta_U0.rxEng_winScaleFifo_blk_n;
assign inst_idle_sigs[40] = rxMetadataHandler_U0.ap_idle;
assign inst_block_sigs[40] = (rxMetadataHandler_U0.ap_done & ~rxMetadataHandler_U0.ap_continue) | ~rxMetadataHandler_U0.rxEng_metaDataFifo_blk_n | ~rxMetadataHandler_U0.portTable2rxEng_check_rsp_blk_n | ~rxMetadataHandler_U0.rxEng_tupleBuffer_blk_n | ~rxMetadataHandler_U0.rxEng_metaHandlerEventFifo_blk_n | ~rxMetadataHandler_U0.rxEng_metaHandlerDropFifo_blk_n | ~rxMetadataHandler_U0.rxEng2sLookup_req_blk_n | ~rxMetadataHandler_U0.sLookup2rxEng_rsp_blk_n | ~rxMetadataHandler_U0.rxEng_fsmMetaDataFifo_blk_n;
assign inst_idle_sigs[41] = rxTcpFSM_U0.ap_idle;
assign inst_block_sigs[41] = (rxTcpFSM_U0.ap_done & ~rxTcpFSM_U0.ap_continue) | ~rxTcpFSM_U0.rxbuffer_data_count_blk_n | ~rxTcpFSM_U0.rxbuffer_max_data_count_blk_n | ~rxTcpFSM_U0.rxEng_fsmMetaDataFifo_blk_n | ~rxTcpFSM_U0.rxEng2stateTable_upd_req_blk_n | ~rxTcpFSM_U0.rxEng2rxSar_upd_req_blk_n | ~rxTcpFSM_U0.rxEng2txSar_upd_req_blk_n | ~rxTcpFSM_U0.stateTable2rxEng_upd_rsp_blk_n | ~rxTcpFSM_U0.rxSar2rxEng_upd_rsp_blk_n | ~rxTcpFSM_U0.txSar2rxEng_upd_rsp_blk_n | ~rxTcpFSM_U0.rxEng2timer_clearRetransmitTimer_blk_n | ~rxTcpFSM_U0.rxEng2timer_clearProbeTimer_blk_n | ~rxTcpFSM_U0.rxEng2rxApp_notification_blk_n | ~rxTcpFSM_U0.rxEng_fsmDropFifo_blk_n | ~rxTcpFSM_U0.rxEng_fsmEventFifo_blk_n | ~rxTcpFSM_U0.rxEng2timer_setCloseTimer_blk_n | ~rxTcpFSM_U0.conEstablishedFifo_blk_n;
assign inst_idle_sigs[42] = rxPackageDropper_512_U0.ap_idle;
assign inst_block_sigs[42] = (rxPackageDropper_512_U0.ap_done & ~rxPackageDropper_512_U0.ap_continue) | ~rxPackageDropper_512_U0.rxEng_metaHandlerDropFifo_blk_n | ~rxPackageDropper_512_U0.rxEng_fsmDropFifo_blk_n | ~rxPackageDropper_512_U0.rxEng_dataBuffer3_blk_n | ~rxPackageDropper_512_U0.rxBufferWriteData_internal_blk_n;
assign inst_idle_sigs[43] = rxEventMerger_U0.ap_idle;
assign inst_block_sigs[43] = (rxEventMerger_U0.ap_done & ~rxEventMerger_U0.ap_continue) | ~rxEventMerger_U0.rxEng_metaHandlerEventFifo_blk_n | ~rxEventMerger_U0.rxEng2eventEng_setEvent_blk_n | ~rxEventMerger_U0.rxEng_fsmEventFifo_blk_n;
assign inst_idle_sigs[44] = metaLoader_U0.ap_idle;
assign inst_block_sigs[44] = (metaLoader_U0.ap_done & ~metaLoader_U0.ap_continue) | ~metaLoader_U0.eventEng2txEng_event_blk_n | ~metaLoader_U0.txEngFifoReadCount_blk_n | ~metaLoader_U0.txEng2rxSar_req_blk_n | ~metaLoader_U0.txEng2txSar_upd_req_blk_n | ~metaLoader_U0.rxSar2txEng_rsp_blk_n | ~metaLoader_U0.txSar2txEng_upd_rsp_blk_n | ~metaLoader_U0.txEng2timer_setProbeTimer_blk_n | ~metaLoader_U0.txEng_ipMetaFifo_blk_n | ~metaLoader_U0.txEng_tcpMetaFifo_blk_n | ~metaLoader_U0.txEng_isLookUpFifo_blk_n | ~metaLoader_U0.txEng_isDDRbypass_blk_n | ~metaLoader_U0.txEng2sLookup_rev_req_blk_n | ~metaLoader_U0.txEng2timer_setRetransmitTimer_blk_n | ~metaLoader_U0.txMetaloader2memAccessBreakdown_blk_n | ~metaLoader_U0.txEng_tupleShortCutFifo_blk_n;
assign inst_idle_sigs[45] = txEngMemAccessBreakdown_U0.ap_idle;
assign inst_block_sigs[45] = (txEngMemAccessBreakdown_U0.ap_done & ~txEngMemAccessBreakdown_U0.ap_continue) | ~txEngMemAccessBreakdown_U0.txMetaloader2memAccessBreakdown_blk_n | ~txEngMemAccessBreakdown_U0.memAccessBreakdown2txPkgStitcher_blk_n;
assign inst_idle_sigs[46] = tupleSplitter_U0.ap_idle;
assign inst_block_sigs[46] = (tupleSplitter_U0.ap_done & ~tupleSplitter_U0.ap_continue) | ~tupleSplitter_U0.txEng_isLookUpFifo_blk_n | ~tupleSplitter_U0.sLookup2txEng_rev_rsp_blk_n | ~tupleSplitter_U0.txEng_ipTupleFifo_blk_n | ~tupleSplitter_U0.txEng_tcpTupleFifo_blk_n | ~tupleSplitter_U0.txEng_tupleShortCutFifo_blk_n;
assign inst_idle_sigs[47] = read_data_stitching_512_U0.ap_idle;
assign inst_block_sigs[47] = (read_data_stitching_512_U0.ap_done & ~read_data_stitching_512_U0.ap_continue) | ~read_data_stitching_512_U0.memAccessBreakdown2txPkgStitcher_blk_n | ~read_data_stitching_512_U0.txBufferReadData_internal_blk_n | ~read_data_stitching_512_U0.txBufferReadDataStitched_blk_n;
assign inst_idle_sigs[48] = read_data_arbiter_512_U0.ap_idle;
assign inst_block_sigs[48] = (read_data_arbiter_512_U0.ap_done & ~read_data_arbiter_512_U0.ap_continue) | ~read_data_arbiter_512_U0.txEng_isDDRbypass_blk_n | ~read_data_arbiter_512_U0.txBufferReadDataStitched_blk_n | ~read_data_arbiter_512_U0.txEng_tcpPkgBuffer0_blk_n | ~read_data_arbiter_512_U0.txApp2txEng_data_stream_blk_n;
assign inst_idle_sigs[49] = lshiftWordByOctet_512_51_U0.ap_idle;
assign inst_block_sigs[49] = (lshiftWordByOctet_512_51_U0.ap_done & ~lshiftWordByOctet_512_51_U0.ap_continue) | ~lshiftWordByOctet_512_51_U0.txEng_shift2pseudoFifo_blk_n | ~lshiftWordByOctet_512_51_U0.txEng_tcpPkgBuffer0_blk_n;
assign inst_idle_sigs[50] = pseudoHeaderConstructionNew_512_U0.ap_idle;
assign inst_block_sigs[50] = (pseudoHeaderConstructionNew_512_U0.ap_done & ~pseudoHeaderConstructionNew_512_U0.ap_continue) | ~pseudoHeaderConstructionNew_512_U0.txEng_tcpMetaFifo_blk_n | ~pseudoHeaderConstructionNew_512_U0.txEng_tcpTupleFifo_blk_n | ~pseudoHeaderConstructionNew_512_U0.txEng_tcpPkgBuffer1_blk_n | ~pseudoHeaderConstructionNew_512_U0.txEng_shift2pseudoFifo_blk_n;
assign inst_idle_sigs[51] = two_complement_subchecksums_512_22_U0.ap_idle;
assign inst_block_sigs[51] = (two_complement_subchecksums_512_22_U0.ap_done & ~two_complement_subchecksums_512_22_U0.ap_continue) | ~two_complement_subchecksums_512_22_U0.txEng_tcpPkgBuffer1_blk_n | ~two_complement_subchecksums_512_22_U0.txEng_tcpPkgBuffer2_blk_n | ~two_complement_subchecksums_512_22_U0.txEng_subChecksumsFifo_blk_n;
assign inst_idle_sigs[52] = finalize_ipv4_checksum_32_U0.ap_idle;
assign inst_block_sigs[52] = (finalize_ipv4_checksum_32_U0.ap_done & ~finalize_ipv4_checksum_32_U0.ap_continue) | ~finalize_ipv4_checksum_32_U0.txEng_subChecksumsFifo_blk_n | ~finalize_ipv4_checksum_32_U0.txEng_tcpChecksumFifo_blk_n;
assign inst_idle_sigs[53] = remove_pseudo_header_512_U0.ap_idle;
assign inst_block_sigs[53] = (remove_pseudo_header_512_U0.ap_done & ~remove_pseudo_header_512_U0.ap_continue) | ~remove_pseudo_header_512_U0.txEng_tcpPkgBuffer2_blk_n | ~remove_pseudo_header_512_U0.txEng_tcpPkgBuffer3_blk_n;
assign inst_idle_sigs[54] = rshiftWordByOctet_net_axis_512_512_53_U0.ap_idle;
assign inst_block_sigs[54] = (rshiftWordByOctet_net_axis_512_512_53_U0.ap_done & ~rshiftWordByOctet_net_axis_512_512_53_U0.ap_continue) | ~rshiftWordByOctet_net_axis_512_512_53_U0.txEng_tcpPkgBuffer3_blk_n | ~rshiftWordByOctet_net_axis_512_512_53_U0.txEng_tcpPkgBuffer4_blk_n;
assign inst_idle_sigs[55] = insert_checksum_512_U0.ap_idle;
assign inst_block_sigs[55] = (insert_checksum_512_U0.ap_done & ~insert_checksum_512_U0.ap_continue) | ~insert_checksum_512_U0.txEng_tcpChecksumFifo_blk_n | ~insert_checksum_512_U0.txEng_tcpPkgBuffer4_blk_n | ~insert_checksum_512_U0.txEng_tcpPkgBuffer5_blk_n;
assign inst_idle_sigs[56] = lshiftWordByOctet_512_52_U0.ap_idle;
assign inst_block_sigs[56] = (lshiftWordByOctet_512_52_U0.ap_done & ~lshiftWordByOctet_512_52_U0.ap_continue) | ~lshiftWordByOctet_512_52_U0.txEng_tcpPkgBuffer6_blk_n | ~lshiftWordByOctet_512_52_U0.txEng_tcpPkgBuffer5_blk_n;
assign inst_idle_sigs[57] = generate_ipv4_512_U0.ap_idle;
assign inst_block_sigs[57] = (generate_ipv4_512_U0.ap_done & ~generate_ipv4_512_U0.ap_continue) | ~generate_ipv4_512_U0.txEng_ipMetaFifo_blk_n | ~generate_ipv4_512_U0.txEng_ipTupleFifo_blk_n | ~generate_ipv4_512_U0.ipTxData_internal_blk_n | ~generate_ipv4_512_U0.txEng_tcpPkgBuffer6_blk_n;
assign inst_idle_sigs[58] = rx_app_stream_if_U0.ap_idle;
assign inst_block_sigs[58] = (rx_app_stream_if_U0.ap_done & ~rx_app_stream_if_U0.ap_continue) | ~rx_app_stream_if_U0.rxApp2rxSar_upd_req_blk_n | ~rx_app_stream_if_U0.rxSar2rxApp_upd_rsp_blk_n | ~rx_app_stream_if_U0.rxBufferReadCmd_blk_n;
assign inst_idle_sigs[59] = rxAppMemDataRead_512_U0.ap_idle;
assign inst_block_sigs[59] = (rxAppMemDataRead_512_U0.ap_done & ~rxAppMemDataRead_512_U0.ap_continue) | ~rxAppMemDataRead_512_U0.rxBufferReadCmd_blk_n | ~rxAppMemDataRead_512_U0.rxBufferReadData_internal_blk_n | ~rxAppMemDataRead_512_U0.rxDataRsp_internal_blk_n;
assign inst_idle_sigs[60] = rx_app_if_U0.ap_idle;
assign inst_block_sigs[60] = (rx_app_if_U0.ap_done & ~rx_app_if_U0.ap_continue) | ~rx_app_if_U0.rxApp2portTable_listen_req_blk_n | ~rx_app_if_U0.portTable2rxApp_listen_rsp_blk_n;
assign inst_idle_sigs[61] = stream_merger_appNotification_U0.ap_idle;
assign inst_block_sigs[61] = (stream_merger_appNotification_U0.ap_done & ~stream_merger_appNotification_U0.ap_continue) | ~stream_merger_appNotification_U0.rxEng2rxApp_notification_blk_n | ~stream_merger_appNotification_U0.timer2rxApp_notification_blk_n;
assign inst_idle_sigs[62] = txEventMerger_U0.ap_idle;
assign inst_block_sigs[62] = (txEventMerger_U0.ap_done & ~txEventMerger_U0.ap_continue) | ~txEventMerger_U0.txApp2eventEng_mergeEvent_blk_n | ~txEventMerger_U0.txApp2eventEng_setEvent_blk_n | ~txEventMerger_U0.txAppStream2event_mergeEvent_blk_n | ~txEventMerger_U0.txApp_txEventCache_blk_n;
assign inst_idle_sigs[63] = txAppStatusHandler_U0.ap_idle;
assign inst_block_sigs[63] = (txAppStatusHandler_U0.ap_done & ~txAppStatusHandler_U0.ap_continue) | ~txAppStatusHandler_U0.txApp_txEventCache_blk_n | ~txAppStatusHandler_U0.txApp2txSar_push_blk_n;
assign inst_idle_sigs[64] = tasi_metaLoader_U0.ap_idle;
assign inst_block_sigs[64] = (tasi_metaLoader_U0.ap_done & ~tasi_metaLoader_U0.ap_continue) | ~tasi_metaLoader_U0.txApp2stateTable_req_blk_n | ~tasi_metaLoader_U0.txApp2txSar_upd_req_blk_n | ~tasi_metaLoader_U0.txSar2txApp_upd_rsp_blk_n | ~tasi_metaLoader_U0.stateTable2txApp_rsp_blk_n | ~tasi_metaLoader_U0.tasi_meta2pkgPushCmd_blk_n | ~tasi_metaLoader_U0.txAppStream2event_mergeEvent_blk_n;
assign inst_idle_sigs[65] = toe_duplicate_stream_net_axis_512_U0.ap_idle;
assign inst_block_sigs[65] = (toe_duplicate_stream_net_axis_512_U0.ap_done & ~toe_duplicate_stream_net_axis_512_U0.ap_continue) | ~toe_duplicate_stream_net_axis_512_U0.txDataReq_internal_blk_n | ~toe_duplicate_stream_net_axis_512_U0.tasi_dataFifo_blk_n | ~toe_duplicate_stream_net_axis_512_U0.txApp2txEng_data_stream_blk_n;
assign inst_idle_sigs[66] = tasi_pkg_pusher_512_U0.ap_idle;
assign inst_block_sigs[66] = (tasi_pkg_pusher_512_U0.ap_done & ~tasi_pkg_pusher_512_U0.ap_continue) | ~tasi_pkg_pusher_512_U0.tasi_meta2pkgPushCmd_blk_n | ~tasi_pkg_pusher_512_U0.tasi_dataFifo_blk_n | ~tasi_pkg_pusher_512_U0.txBufferWriteData_internal_blk_n;
assign inst_idle_sigs[67] = tx_app_if_U0.ap_idle;
assign inst_block_sigs[67] = (tx_app_if_U0.ap_done & ~tx_app_if_U0.ap_continue) | ~tx_app_if_U0.myIpAddress_blk_n | ~tx_app_if_U0.portTable2txApp_port_rsp_blk_n | ~tx_app_if_U0.txApp2sLookup_req_blk_n | ~tx_app_if_U0.sLookup2txApp_rsp_blk_n | ~tx_app_if_U0.txApp2eventEng_mergeEvent_blk_n | ~tx_app_if_U0.txApp2stateTable_upd_req_blk_n | ~tx_app_if_U0.conEstablishedFifo_blk_n | ~tx_app_if_U0.timer2txApp_notification_blk_n | ~tx_app_if_U0.stateTable2txApp_upd_rsp_blk_n;
assign inst_idle_sigs[68] = tx_app_table_U0.ap_idle;
assign inst_block_sigs[68] = (tx_app_table_U0.ap_done & ~tx_app_table_U0.ap_continue) | ~tx_app_table_U0.txSar2txApp_ack_push_blk_n | ~tx_app_table_U0.txApp2txSar_upd_req_blk_n | ~tx_app_table_U0.txSar2txApp_upd_rsp_blk_n;

assign inst_idle_sigs[69] = 1'b0;
assign inst_idle_sigs[70] = convert_axis_to_net_axis_512_U0.ap_idle;
assign inst_idle_sigs[71] = convert_axis_to_net_axis_512_1_U0.ap_idle;
assign inst_idle_sigs[72] = convert_axis_to_net_axis_512_2_U0.ap_idle;
assign inst_idle_sigs[73] = convert_net_axis_to_axis_512_U0.ap_idle;
assign inst_idle_sigs[74] = convert_net_axis_to_axis_512_3_U0.ap_idle;
assign inst_idle_sigs[75] = convert_net_axis_to_axis_512_4_U0.ap_idle;
assign inst_idle_sigs[76] = convert_axis_to_net_axis_512_5_U0.ap_idle;
assign inst_idle_sigs[77] = convert_net_axis_to_axis_512_6_U0.ap_idle;
assign inst_idle_sigs[78] = lookupReplyHandler_U0.ap_idle;
assign inst_idle_sigs[79] = updateRequestSender_U0.ap_idle;
assign inst_idle_sigs[80] = updateReplyHandler_U0.ap_idle;
assign inst_idle_sigs[81] = txEngMemAccessBreakdown_U0.ap_idle;
assign inst_idle_sigs[82] = rx_app_stream_if_U0.ap_idle;
assign inst_idle_sigs[83] = rx_app_if_U0.ap_idle;
assign inst_idle_sigs[84] = stream_merger_appNotification_U0.ap_idle;
assign inst_idle_sigs[85] = txAppStatusHandler_U0.ap_idle;
assign inst_idle_sigs[86] = tasi_metaLoader_U0.ap_idle;
assign inst_idle_sigs[87] = tasi_pkg_pusher_512_U0.ap_idle;
assign inst_idle_sigs[88] = tx_app_if_U0.ap_idle;

toe_top_hls_deadlock_idx0_monitor toe_top_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);

always @ (kernel_block or kernel_monitor_reset) begin
    if (kernel_block == 1'b1 && kernel_monitor_reset == 1'b0) begin
        find_kernel_block = 1'b1;
    end
    else begin
        find_kernel_block = 1'b0;
    end
end