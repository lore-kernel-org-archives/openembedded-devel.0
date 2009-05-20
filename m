Received: from [85.115.52.190] (helo=cluster-a.mailcontrol.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Matteo.Fortini@mta.it>) id 1M6pD9-00008h-I2
	for openembedded-devel@openembedded.org; Wed, 20 May 2009 19:04:12 +0200
Received: from mailserver.mta.int (mail.mta.it [89.96.171.250])
	by rly13a.srv.mailcontrol.com (MailControl) with ESMTP id
	n4KGuYKl017639 for <openembedded-devel@openembedded.org>;
	Wed, 20 May 2009 17:56:42 +0100
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mailserver.mta.int with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 20 May 2009 18:56:33 +0200
Received: from [172.26.6.74] (172.26.6.74) by mta-digicas.mta.int
	(172.26.10.8) with Microsoft SMTP Server (TLS) id 8.1.336.0;
	Wed, 20 May 2009 18:56:33 +0200
Message-ID: <4A143640.3040606@mta.it>
Date: Wed, 20 May 2009 18:56:32 +0200
From: Matteo Fortini <matteo.fortini@mta.it>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 20 May 2009 16:56:33.0825 (UTC)
	FILETIME=[EE399910:01C9D96B]
X-Scanned-By: MailControl A-06-00-00 (www.mailcontrol.com) on 10.65.0.123
Subject: rrdtool fails to build
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
X-List-Received-Date: Wed, 20 May 2009 17:04:13 -0000
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
I'm trying to build rrdtool on Angstrom on a powerpc target, and it 
mysteriously fails even before unpacking the sources.

If I try to build it manually, I get some ./configure errors about 
missing ieee math support.




