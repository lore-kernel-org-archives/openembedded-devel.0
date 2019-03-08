Return-Path: <JK.Behnke@web.de>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Mar 2019 13:34:48 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
	by mail.openembedded.org (Postfix) with ESMTP id 6135C7CE85
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1552052088;
	bh=mxHq4DpjJ1sp6TIMasgDwc/G4EXX/axI2SomL0F4zEQ=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=MbETR4AtB3807K0aMp/KzVJ+x2EczyqT8broA/1McnPcLKyOc4ir5yFIb/t1KA3Xu
	ygbcAazRZsibYSxnK/88BmzkHNWMKdSaHfb08t/jv5ho0s125tPH8K68OmmhFshrZt
	iUlTtVVW9bPrfWQtcdd6cVjBL0U+BZJC9sXSBGTk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [212.185.41.2] ([212.185.41.2]) by web-mail.web.de
	(3c-app-webde-bs44.server.lan [172.19.170.44]) (via HTTP);
	Fri, 8 Mar 2019 14:29:46 +0100
Message-ID: <trinity-c0b64e17-7878-4cf2-b46c-881a1b38055e-1552051786391@3c-app-webde-bs44>
From: JK.Behnke@web.de
To: openembedded-devel@lists.openembedded.org
Date: Fri, 8 Mar 2019 14:29:46 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:tPFVftzdYA08ZgLYQVMqhWoXZKfNX/ftoLq+wFdXejpl6CR1sLBJDFVL8cqc9ic78YhvM
	1vx0DKLLqnXnemEK0TEZC+z3ILS8Vx6GMyptyvDvDPTaXb30ay2JKBkF2GumTbE4uKY+a8L7YIzx
	JWAk4Gj3HRa/fEBQSMbwucYP2xWMJ/yV9DPII+Cyw2QUoHMKVTplYSuxrE9HkI5VTSS2XRKb3MB+
	LCh62YBlbany2sw6aStMil4IUPaPV3JwYXKseQ5IqzHoh6djEb0ZhwdSCvsePmzkwdcUxpMW1tdV
	jE=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tg1/jN8NJx8=:S2Cv8Fd1zUmWNBtR8fO36q
	fGxtSxPw1fpPWYzN1sEvsRZXcbDZqsQ5l1pkJlJOi442MUAg+bAvoi4Mzt4QsklJUd+XIV1oI
	CsG2Uzp+PyL7egKsRYXScPfzsopz2vk9/GiCdKCGGYEwTlReJtZDlNV4B0i6GZukOvON5Meul
	Y4X8x+SJAzcRQJTbKvAIOxzKbh2b2uTPaZ+6Iece1wNxRbmlIApNZHgQX5WUPQtWApIVFlAKy
	X7nYOePlVnX+THBXycVKbEXB/JUsKkd33yGm6osdTyoV/JadyBIjFdrpK4N4cp9T2pl3/TjG4
	n0JlQxm9ZWKnN5RCWh0CNVYSzbBPpLbI7T7S7JCt3ymQ088wikoV4u1Q9MFJ/iK+OvUvNGW7X
	Pf7Y+jXW2i6l0p+56XnLg2X970I1kI2OlEYTisrhlOdHcui7ilmdsqSnelikPD/i72eEdvFoU
	6f3v2b4uyLOvO6wF5fMMBrQjvj6jd1k1kmDNP8W7luBPCqiaZv3aRj+NEfk1ZzQIho1a0edIl
	H69WFalVyBJ7PgmPbR4/AGF6GhBU7R4Ytxg8csfq1p1jILem+H22KepVj+CXQ2wZUQvCtOLH/
	sxUTZQuJtSbYo=
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-qt5 - support for QT 5.12.1?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2019 13:34:48 -0000
Content-Type: text/plain; charset="UTF-8"


