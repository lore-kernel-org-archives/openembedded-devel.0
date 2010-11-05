Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PEIfo-0006Rb-3w
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 10:33:32 +0100
Received: by iwn42 with SMTP id 42so2651643iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YyvSASzGfDLgB8aZV6RJvk37Iis2AbflKAtrJ33WP9k=;
	b=A2Eh2hoPWQK6R/JclF4ruOwNuCGU0R8hmDZfhhj8pokcYEAZ0FP4X/lDhU4Yfy/ym/
	l/QuD5WgbGlYjescyYjmDSbwPqlKZtEoGgO34A6+eZgB4fL5kiJU4jsBV0ejRgfIhPN4
	Dl4jAF44j/Szk2AJmuUeDtewOFKHPknXmMvD8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IstBOXQ19royiv2nwJI2rc739HTyqeWL+MSKumPq4Sbal8eGpTr5ml8C+wmKT8RFaH
	n614/sAwvNrOqA5M+sG8QKdxWGY9siU6XbmwuVKAEWx1JidX7aMEiFxBFmSGcwywfb3X
	+6vWaP6ioxQuZK5mRmK+BbtRsq72VD4UGMDnE=
MIME-Version: 1.0
Received: by 10.42.74.137 with SMTP id w9mr1301122icj.201.1288949555395; Fri,
	05 Nov 2010 02:32:35 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Fri, 5 Nov 2010 02:32:35 -0700 (PDT)
In-Reply-To: <AANLkTimLpymROEFYv6+TsvtRP-nf8xzNKFp+-d6Q9K8r@mail.gmail.com>
References: <AANLkTimLpymROEFYv6+TsvtRP-nf8xzNKFp+-d6Q9K8r@mail.gmail.com>
Date: Fri, 5 Nov 2010 10:32:35 +0100
Message-ID: <AANLkTi=a75pp0kW+0Ps=R2taDvRAgtXiiT6Ot8VfjykD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-11-04
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
X-List-Received-Date: Fri, 05 Nov 2010 09:33:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/4 Cliff Brake <cliff.brake@gmail.com>:
> Had a decent run with testing last week as a number of combinations built=
:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtested_2010-=
10-29
>
> testing-next is ready for clean builds. =A0testing branch has been moved
> forward to last weeks testing-next.
>
> For more information on testing, please see:
> http://wiki.openembedded.org/index.php/Testing#Testing_Log
>
> Thanks,
> Cliff
>

Thanks Cliff.

As requested I have added my testing script to the tree.
(contrib/testing/testscript.sh )
It is just pushed so it does not appear in this weeks testing-next branch.
http://wiki.openembedded.net/index.php/TestingScript

Feel free to improve! Frans


