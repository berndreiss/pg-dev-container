static void
ReorderBufferFreeSnap(ReorderBuffer *rb, Snapshot snap)
{
	if (snap->copied)
		free(snap);
	else
		SnapBuildSnapDecRefcount(snap);
}
