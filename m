Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <craig.mcqueen@beamcommunications.com>)
	id 1SUqoF-0000NA-VM for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 04:51:24 +0200
Received: from mail105-db3-R.bigfish.com (10.3.81.249) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.23; Thu, 17 May 2012 01:55:49 +0000
Received: from mail105-db3 (localhost [127.0.0.1])	by
	mail105-db3-R.bigfish.com (Postfix) with ESMTP id 47C7C404C5	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 01:55:49 +0000 (UTC)
X-SpamScore: 0
X-BigFish: PS0(zzzz1202hzz8275ch8275dhz2dh2a8h668h839h93fhd25h)
X-Forefront-Antispam-Report: CIP:111.221.66.13; KIP:(null); UIP:(null); IPV:NLI;
	H:HKNPRD0204HT004.apcprd02.prod.outlook.com; RD:none; EFVD:NLI
Received: from mail105-db3 (localhost.localdomain [127.0.0.1]) by mail105-db3
	(MessageSwitch) id 1337219746650436_30815;
	Thu, 17 May 2012 01:55:46 +0000 (UTC)
Received: from DB3EHSMHS011.bigfish.com (unknown [10.3.81.248])	by
	mail105-db3.bigfish.com (Postfix) with ESMTP id 9A95E3600EC	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 01:55:46 +0000 (UTC)
Received: from HKNPRD0204HT004.apcprd02.prod.outlook.com (111.221.66.13) by
	DB3EHSMHS011.bigfish.com (10.3.87.111) with Microsoft SMTP Server (TLS)
	id 14.1.225.23; Thu, 17 May 2012 01:55:45 +0000
Received: from HKNPRD0204MB116.apcprd02.prod.outlook.com ([169.254.12.104]) by
	HKNPRD0204HT004.apcprd02.prod.outlook.com ([10.9.122.185]) with mapi
	id 14.15.0074.002; Thu, 17 May 2012 01:55:49 +0000
From: Craig McQueen <craig.mcqueen@beamcommunications.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: base-passwd URI invalid in OE classic
Thread-Index: Ac0z0C4obFiT5HTsTbO2Eh5g3m6l4Q==
Date: Thu, 17 May 2012 01:55:46 +0000
Message-ID: <DB8F1B3EEF94C3439BFFE674EB05E3CC02844E@HKNPRD0204MB116.apcprd02.prod.outlook.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.9.122.7]
MIME-Version: 1.0
X-OriginatorOrg: beamcommunications.com
Subject: base-passwd URI invalid in OE classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 02:51:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkknbSB0cnlpbmcgdG8gYnVpbGQgT0UgY2xhc3NpYyBmb3IgaS5NWDI4LCBmb2xs
b3dpbmcgaW5zdHJ1Y3Rpb25zIGF0Og0KaHR0cDovL3d3dy5pbXhkZXYub3JnL3dpa2kvaW5kZXgu
cGhwP3RpdGxlPUFsbF9Cb2FyZHNfT3BlbkVtYmVkZGVkDQoNCkknbSB0cnlpbmcgdG8gcnVuOg0K
ICAgYml0YmFrZSBib290c3RyYXAtaW1hZ2UNCg0KQnV0IGl0J3MgYnJlYWtpbmcgb24gYmFzZS1w
YXNzd2QsIGRvd25sb2FkaW5nIGZyb206DQpodHRwOi8vc25hcHNob3QuZGViaWFuLm5ldC9hcmNo
aXZlL3Bvb2wvYi9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjUuMjAudGFyLmd6DQp3aGljaCBm
YWlscyBNRDUgYmVjYXVzZSBpdCBpc24ndCBhIHZhbGlkIGxpbmsuDQoNCkkgZm91bmQgdGhpcyBp
cyB2YWxpZDoNCmh0dHA6Ly9zbmFwc2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMTIw
MTAxVDAzMzA0MlovcG9vbC9tYWluL2IvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2RfMy41LjIwLnRh
ci5neg0KDQpCdXQgaXMgdGhhdCBzdWl0YWJsZSB0byBwdXQgaW4gU1JDX1VSSSBpbiBiYXNlLXBh
c3N3ZF8zLjUuMjAuYmI/DQoNCldoYXQgaXMgYSBnb29kIHdheSB0byBmaXggdGhpcyBwcm9ibGVt
Pw0KDQpSZWdhcmRzLA0KQ3JhaWcgTWNRdWVlbg0KDQo=



