# Netcat

客户端

```bash
➜  Resources nc -4 -u 127.0.0.1 12201


fodsfud
fdasgdsfdsf
```

服务端Graylog

```bash
2016-09-02 12:16:29,793 ERROR: org.graylog2.shared.buffers.processors.DecodingProcessor - Unable to decode raw message 14218670-7107-11e6-9c2d-0242ac120004 (journal offset 1) encoded as gelf received from unknown source.
2016-09-02 12:16:29,795 ERROR: org.graylog2.shared.buffers.processors.DecodingProcessor - Error processing message RawMessage{id=14218670-7107-11e6-9c2d-0242ac120004, journalOffset=1, codec=gelf, payloadSize=12, timestamp=2016-09-02T12:16:29.783Z}
com.fasterxml.jackson.core.JsonParseException: Unrecognized token 'fdasgdsfdsf': was expecting 'null', 'true', 'false' or NaN
 at [Source: fdasgdsfdsf
; line: 1, column: 12]
	at com.fasterxml.jackson.core.JsonParser._constructError(JsonParser.java:1586) ~[graylog.jar:?]
	at com.fasterxml.jackson.core.base.ParserMinimalBase._reportError(ParserMinimalBase.java:521) ~[graylog.jar:?]
	at com.fasterxml.jackson.core.json.ReaderBasedJsonParser._reportInvalidToken(ReaderBasedJsonParser.java:2754) ~[graylog.jar:?]
	at com.fasterxml.jackson.core.json.ReaderBasedJsonParser._reportInvalidToken(ReaderBasedJsonParser.java:2731) ~[graylog.jar:?]
	at com.fasterxml.jackson.core.json.ReaderBasedJsonParser._matchToken(ReaderBasedJsonParser.java:2538) ~[graylog.jar:?]
	at com.fasterxml.jackson.core.json.ReaderBasedJsonParser._matchFalse(ReaderBasedJsonParser.java:2505) ~[graylog.jar:?]
	at com.fasterxml.jackson.core.json.ReaderBasedJsonParser.nextToken(ReaderBasedJsonParser.java:680) ~[graylog.jar:?]
	at com.fasterxml.jackson.databind.ObjectMapper._initForReading(ObjectMapper.java:3847) ~[graylog.jar:?]
	at com.fasterxml.jackson.databind.ObjectMapper._readMapAndClose(ObjectMapper.java:3792) ~[graylog.jar:?]
	at com.fasterxml.jackson.databind.ObjectMapper.readTree(ObjectMapper.java:2332) ~[graylog.jar:?]
	at org.graylog2.inputs.codecs.GelfCodec.decode(GelfCodec.java:120) ~[graylog.jar:?]
	at org.graylog2.shared.buffers.processors.DecodingProcessor.processMessage(DecodingProcessor.java:143) ~[graylog.jar:?]
	at org.graylog2.shared.buffers.processors.DecodingProcessor.onEvent(DecodingProcessor.java:86) [graylog.jar:?]
	at org.graylog2.shared.buffers.processors.ProcessBufferProcessor.onEvent(ProcessBufferProcessor.java:58) [graylog.jar:?]
	at org.graylog2.shared.buffers.processors.ProcessBufferProcessor.onEvent(ProcessBufferProcessor.java:35) [graylog.jar:?]
	at com.lmax.disruptor.WorkProcessor.run(WorkProcessor.java:143) [graylog.jar:?]
	at com.codahale.metrics.InstrumentedThreadFactory$InstrumentedRunnable.run(InstrumentedThreadFactory.java:66) [graylog.jar:?]
	at java.lang.Thread.run(Thread.java:745) [?:1.8.0_102]
```

* [8 个实用的 Linux netcat 命令示例](http://www.oschina.net/question/12_50469)
