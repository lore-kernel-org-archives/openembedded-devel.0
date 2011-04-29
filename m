Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Daniele.Bosi@mta.it>) id 1QFp4n-0008Nj-Pr
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 16:53:49 +0200
Received: from mail.mta.it (mail.mta.it [91.143.207.180])
	by rly22a.srv.mailcontrol.com (MailControl) with ESMTP id
	p3TEpB8n014894 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 15:51:16 +0100
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mail.mta.it with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 29 Apr 2011 16:50:53 +0200
Received: from mta-digimail.MTA.INT ([172.26.10.14]) by mta-digicas.MTA.INT
	([172.26.10.13]) with mapi; Fri, 29 Apr 2011 16:50:58 +0200
From: Bosi Daniele <Daniele.Bosi@mta.it>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Apr 2011 16:50:51 +0200
Thread-Topic: [oe] how to read pdf documents
Thread-Index: AcwGfNjVRaRkXogvSk2pmyFIVKQLuQ==
Message-ID: <531B6536C9F737458807DF75064873C801ED5F36E7A3@mta-digimail.MTA.INT>
Accept-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: it-IT
MIME-Version: 1.0
X-OriginalArrivalTime: 29 Apr 2011 14:50:53.0362 (UTC)
	FILETIME=[D6A30120:01CC067C]
X-Scanned-By: MailControl A_10_80_00 (www.mailcontrol.com) on 10.65.0.132
Subject: how to read pdf documents
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
X-List-Received-Date: Fri, 29 Apr 2011 14:53:49 -0000
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Guys,
I'm trying to read pdf files on my embedded system. Googling around I found=
 people suggesting to use Poppler as a library for reading such type of doc=
uments.

Is there any Open Embedded software that use Poppler for reading pdf files?=
 I'd like to use an existing software for testing my machine, that is "angs=
trom-2008.1" with some custom rules for our softwares.

I tried some example taken from the internet but I have some trouble buildi=
ng them.
One of them is the one from
http://people.freedesktop.org/~aacid/docs/qt4/
that includes the file <poppler-qt4.h> that in my system is missing.

Bye the way I just made a "bitbake poppler" and I create my target file sys=
tem.
Maybe have I forgot to build something?

Thanks in advance, bye
Daniele





