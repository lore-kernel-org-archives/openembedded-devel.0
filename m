Received: from web88207.mail.re2.yahoo.com ([206.190.37.222])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <jkortje750@rogers.com>) id 1NpESD-00010d-BV
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 06:27:37 +0100
Received: (qmail 74199 invoked by uid 60001); 10 Mar 2010 05:17:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rogers.com; s=s1024;
	t=1268198274; bh=0lb9EZn3xY2z5dsOL2oTnsI0eQppI8aXQKWkwq1qmmA=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=RKHMWBc8+uQ9UAnUXMVjKXeNYw5InuUhfIHH2XseFhnGhLYDL+KlgyMlPNKElrLOUmHfzibDZJTeruHOdCN9JIwKv6cdp+0v1ZBCjZDliXmyL6wLvpB6zQ1olhQ2L06rdOP+ZCN8GnzRW+4hrPY/jIjmXsaagSjNAnWL21C6tMA=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=rogers.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=IFb83wtRKzJPdU25k1HsmSSQOWEDmg7DBSJfEEcnVuQ15Pqvqk+0YTpaOTJFEAmQrp71d+NLfgMRt7adWwb9tdof+cmywdkaI840Ida7EHWuDf6rGMdpjkB5PcgfhVjkaWLhD5ZLery+VilFTsLmaHEIa0m/FPUhrGToD9g1owE=;
Message-ID: <759741.73773.qm@web88207.mail.re2.yahoo.com>
X-YMail-OSG: T9P62z4VM1m2_SNdvu8zlnxDiHID6p3Xi9jx0ujXi5u6p0Fz87qn0fCpZNwoSVymOgj0f.WQmXxMXm6xXPT8p1RhdGhHpPzGKIx6Y9G_7jMXnBZEvmkH91RGg6qk.3RfwRFqvL9h2EljxNiOS87cRD2Mhhg9DLcqOZodbeMq5OyNtk5Tjmq82AvBgKzRtPqhktaa3lyN9x4Y10MbrHo_K1LOuE5jr1XCNGnwWR_2N6tMURYd5XmbREc5CcIS4aLAPORFl7DUBWmMjfIK_B_pItcBSKg.SxhE2AXZ5F25zk2256vR07SL993YsRjVqEjLdIi0rJIwc9KnJ2eTdubPZj.s0tQyjpKiStZW
Received: from [99.237.255.32] by web88207.mail.re2.yahoo.com via HTTP;
	Tue, 09 Mar 2010 21:17:54 PST
X-Mailer: YahooMailRC/300.3 YahooMailWebService/0.8.100.260964
References: <mailman.5417.1268191803.14961.openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Mar 2010 21:17:54 -0800 (PST)
From: JOSEPH KORTJE <jkortje750@rogers.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <mailman.5417.1268191803.14961.openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 206.190.37.222
X-SA-Exim-Mail-From: jkortje750@rogers.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: git.openembedded.org server down?
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
X-List-Received-Date: Wed, 10 Mar 2010 05:27:37 -0000
Content-Type: text/plain; charset=us-ascii

I have been attempting to do a git pull since about 6 hours now.
When will the server be working again?

Here is the error >

~/beagle-oe/openembedded$ git pull
git.openembedded.org[0: 140.211.169.165]: errno=Connection timed out
fatal: unable to connect a socket (Connection timed out)
From lamiaposta71@gmail.com Wed Mar 10 07:33:32 2010
Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1NpFTz-000659-Fo
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 07:33:32 +0100
Received: by fxm25 with SMTP id 25so1521205fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 22:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=y9nn1Fa17S7Fx6Zlf3eaC9fDDxCFIsPacNZ1ykxA+4c=;
	b=gA7zBabICbW4+5dTnTPwvrjKuwtKgubhtTHv5m8DbrMd5SNZxy/W+U7+cHq7f47Z3e
	B6RekpTqwvB96fhhFwUS9cPZ3uMuJukIhtIkBQG+XHmI/YLf8QNMlove4mBHKIqJ7Z6K
	sfSovJbM00ilptuWZaexJAmz53lBi2NA19tF0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=e0Oik/isjywTd3CyHl72mKGn2Mlwm2zsIjH/S3bxl/ODIic03bPxzNnaMSenLK5Hxu
	lAJNEw7+uPTQGTsP5xaA0YuumQQ/Psa39TOi8QF/H98FJYNXwY2MqsvSZn870cXtz07y
	+Ibk0lbOnaoke4k43jTdw2lvABwx31IZ2H+zA=
MIME-Version: 1.0
Received: by 10.223.4.132 with SMTP id 4mr922386far.90.1268202629689; Tue, 09 
	Mar 2010 22:30:29 -0800 (PST)
In-Reply-To: <759741.73773.qm@web88207.mail.re2.yahoo.com>
References: <mailman.5417.1268191803.14961.openembedded-devel@lists.openembedded.org>
	<759741.73773.qm@web88207.mail.re2.yahoo.com>
Date: Wed, 10 Mar 2010 07:30:29 +0100
Message-ID: <ade1bdc1003092230u1b16756i138a2745963dea29@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Content-Type: text/plain; charset=ISO-8859-1
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe] git.openembedded.org server down?
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
X-List-Received-Date: Wed, 10 Mar 2010 06:33:32 -0000

2010/3/10 JOSEPH KORTJE <jkortje750@rogers.com>

> I have been attempting to do a git pull since about 6 hours now.
> When will the server be working again?
>
> Here is the error >
>
> ~/beagle-oe/openembedded$ git pull
> git.openembedded.org[0: 140.211.169.165]: errno=Connection timed out
> fatal: unable to connect a socket (Connection timed out)
>


Now I've done:
git clone http://repo.or.cz/r/openembedded.git
Initialized empty Git repository in /home/recalcati/openembedded/.git/
Checking out files: 100% (22665/22665), done.

du -sh openembedded/
598M    openembedded/

http server works.
The git one I can't test.




> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
www.opensurf.it

