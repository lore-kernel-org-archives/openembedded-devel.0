Received: from [128.178.50.19] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1HwfM6-0003wy-27
	for openembedded-devel@openembedded.org; Fri, 08 Jun 2007 16:22:22 +0200
Received: (qmail 15419 invoked by uid 107); 8 Jun 2007 14:19:48 -0000
Received: from mailav3.epfl.ch (128.178.50.11)
	by smtp0.epfl.ch with SMTP; 8 Jun 2007 14:19:48 -0000
Received: from (unknown [128.178.50.22]) by MAILAV3.epfl.ch with smtp
	id 1931_50650b3a_15cb_11dc_8fcc_0014221528b0;
	Fri, 08 Jun 2007 16:19:48 +0200
Received: from lsa1pc7.epfl.ch (128.178.145.53)
	by smtp1.epfl.ch (AngelmatoPhylax SMTP proxy);
	Fri, 08 Jun 2007 16:19:48 +0200
X-Sendermtaip: 128.178.145.53
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
Organization: EPFL STI-IPR-LSRO1
To: openembedded-devel@lists.openembedded.org
Date: Fri, 8 Jun 2007 16:19:47 +0200
User-Agent: KMail/1.9.6
References: <200706071519.54448.valentin.longchamp@epfl.ch>
	<200706071610.31324.openembedded@hrw.one.pl>
In-Reply-To: <200706071610.31324.openembedded@hrw.one.pl>
MIME-Version: 1.0
Message-Id: <200706081619.48045.valentin.longchamp@epfl.ch>
Subject: Re: JFFS2 trouble
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2007 14:22:32 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Marcin Juszkiewicz wrote:
> Use "mtdX" instead of "/dev/mtdX". This method was mentioned on this
> mailing list before:
>

Thank you Marcin, it works like a charm !

-- 
Valentin Longchamp
PhD Student
http://people.epfl.ch/valentin.longchamp


