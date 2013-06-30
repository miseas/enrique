package com.sigepro.web.transformer;

public interface Transformer<I,T> {

	
		T transform(I target );
}
