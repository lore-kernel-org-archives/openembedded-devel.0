Received: from n2a.bullet.mail.ac4.yahoo.com ([76.13.13.65])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <gagan2172@yahoo.com>) id 1NUiH4-00023c-9L
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 16:03:17 +0100
Received: from [76.13.13.26] by n2.bullet.mail.ac4.yahoo.com with NNFMP;
	12 Jan 2010 14:57:48 -0000
Received: from [67.195.9.83] by t3.bullet.mail.ac4.yahoo.com with NNFMP;
	12 Jan 2010 14:57:48 -0000
Received: from [98.137.27.223] by t3.bullet.mail.gq1.yahoo.com with NNFMP;
	12 Jan 2010 14:57:47 -0000
Received: from [127.0.0.1] by omp201.mail.gq1.yahoo.com with NNFMP;
	12 Jan 2010 14:57:47 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 356375.93379.bm@omp201.mail.gq1.yahoo.com
Received: (qmail 68484 invoked by uid 60001); 12 Jan 2010 14:57:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1263308267; bh=KBVn8pTfExfMpwxNuxgP5QSaXkiFiHSHvoZmHkMjT5E=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=Ak7oruOvqWR+Wat7f7QeaVvaslPEOoPO0XYkjZuDy7OS6vGfgHca0mvcoBZyNleURpjd9ESlEHsG3QWaPXZC903PS4ATHZ6OdQvNKBLqO1CAkvtw7gs1nj5gxP4KUPMOXgPNcyj890X1AHMdzkEhio3qVuu6XQW1e/rVsxh/8ZQ=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=RxuSMQEnOy7OMBPFPrH27MqWrsVe0DmzEFAukPCpLNGv57nOgVpQUKk5/jfgsrlQbISOqKupmDd72Qx66Ajfw9Ht53BGK7HLWpZypSCGKYUD6Re5qgYQphFzyKcbPunOadBwgdZAQIJHcH4fO/C32P6J6ymbYmkUqScszNKZul8=;
Message-ID: <247988.68463.qm@web112503.mail.gq1.yahoo.com>
X-YMail-OSG: fAqlTx4VM1mNwKJvRSJqgDeFdOIkfBgWCj6jPN9r_07jHj0EcDbK6_BmHWLboFTS0ssCScsLgkdF2Y.M81yrwsx4Sjv7R4Xs87G_BCPMJPw5s8Vpjd46e_GRUTAredQOvXa8kuAsNqJdZLzCpyB4MYsIgizXaBUyyoCVS.UMVSbmpqvt2deiG6KiqxJfl2Or7_ud3XrY2BZMt34_aKTSU7vOQdhNQyJhXsHQIwp6L1En2vNJuzlylneTRaystDGwqKqxjhQsNvGAmq5iC9BsHLpHzVOUNrQQ_iTRQYGguuMSycGYM1P9dcFtIfm29ebBtQ--
Received: from [62.254.217.177] by web112503.mail.gq1.yahoo.com via HTTP;
	Tue, 12 Jan 2010 06:57:47 PST
X-Mailer: YahooMailClassic/9.0.20 YahooMailWebService/0.8.100.260964
Date: Tue, 12 Jan 2010 06:57:47 -0800 (PST)
From: gagan singh <gagan2172@yahoo.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 76.13.13.65
X-SA-Exim-Mail-From: gagan2172@yahoo.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: =?UTF-8?B?RG9lcyBPReKAmXMgQW5nc3Ryb20gTGludXggc3VwcG9ydCBTTVAgKFN5bW1ldHJpYyBtdWx0aXByb2Nlc3NpbmcpIG9uIGJlYWdsZSBib2FyZC4=?=
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
X-List-Received-Date: Tue, 12 Jan 2010 15:03:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Chaps,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Do the Angstrom vers=
ion of Linux supports SMP for=C2=A0 Dual core (A8 + TI DSP 320C64x) beagle =
board. If not, where I should look in tutorial to work on adding support fo=
r such a feature.
=C2=A0I try Google it but no much could be located.
=C2=A0=C2=A0
Regards
=C2=A0
Gagan
=C2=A0



From philb@gnu.org Tue Jan 12 16:08:32 2010
Received: from mail.reciva.com ([82.71.203.194] helo
