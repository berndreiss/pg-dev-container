void
ExecForceStoreMinimalTuple(MinimalTuple mtup,
						   TupleTableSlot *slot,
						   bool shouldFree)
{
	if (TTS_IS_MINIMALTUPLE(slot))
	{
		tts_minimal_store_tuple(slot, mtup, shouldFree);
	}
	else
	{
		HeapTupleData htup;

		ExecClearTuple(slot);

		htup.t_len = mtup->t_len + MINIMAL_TUPLE_OFFSET;
		htup.t_data = (HeapTupleHeader) ((char *) mtup - MINIMAL_TUPLE_OFFSET);
		heap_deform_tuple(&htup, slot->tts_tupleDescriptor,
						  slot->tts_values, slot->tts_isnull);
		ExecStoreVirtualTuple(slot);

		if (shouldFree)
		{
			ExecMaterializeSlot(slot);
			pfree(mtup);
		}
      if (b){
         pfree(mtup);
      }
	}
}
