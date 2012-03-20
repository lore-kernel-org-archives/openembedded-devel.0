Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SA00T-0000f6-Fh
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 15:25:49 +0100
Received: by eaae1 with SMTP id e1so26636eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=x9IvsvUMgSTlw/DJYJWwnwVICRKTFaBwYaVndeTmUuY=;
	b=n71XW4Iu5RGSq9JCVfZREvLN7QBpyCjxdc7N4fBJFa4pyALnUJIIRZIhO5sbLYOsvS
	jCRMCUX13G2bNZDcaqflmlg3RDcWkBJFQkSxn5GrZIpyEuGBrlRCccCakEM7s1Yh4mY+
	txjEYS1cN/43np3vCU9SvheFMRY/sb33RJlKRXkFYOJ5NPM4fvYPaxsMRoCtNpVEwJaR
	n9ZKCiINvrDWf4sspc+hD/BqlWijfgMmxNM7wKnjNuFdl3+Nk+WJPD+k0MGCRxaLN0Cm
	rFVBCrd9rWC+kPzzri315DseuXlQJweVvH3S2Rz9E89ypJD0YvANVpEW0fqhenwFQcqb
	TkaQ==
Received: by 10.50.94.200 with SMTP id de8mr8819736igb.21.1332253016320; Tue,
	20 Mar 2012 07:16:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.43.73 with HTTP; Tue, 20 Mar 2012 07:16:26 -0700 (PDT)
In-Reply-To: <4F682E0C.4030101@dresearch-fe.de>
References: <4F61C54B.1000609@dresearch-fe.de>
	<4F66E4F2.2000909@dresearch-fe.de>
	<CA+M6bXmpiegfSspYOwybxKSLf4Ukg5tjRL4VR1aq8T4EFyaaRg@mail.gmail.com>
	<CACW_hTbMZ5R6VB_BChH+3rxx-tqV3jqxioX8Q5ZWsoiHJWZ=7w@mail.gmail.com>
	<20120319162122.GA19810@bill-the-cat>
	<4F682E0C.4030101@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Mar 2012 07:16:26 -0700
Message-ID: <CAMKF1spMP1LHMM76RTbiOwkijgy5c0_9FfbUAc9V_xZ7VBEZgA@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: libmatthew-java-0.7.1.tar.gz not fetchable
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
X-List-Received-Date: Tue, 20 Mar 2012 14:25:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 20, 2012 at 12:13 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>
> Khem has put the tarball on the mirror. But this does not fix our problem.
>
> Fetching from the original url downloads an XHTML error page and stores it under the name of the archive. This of course results in a checksum mismatch. :(
>

I might have put a wrong one. I redid it please try again after
deleting it from your DL_DIR

> So in my opinion changing the recipe to the fedoraproject url seems to be the best way.
>
> Regards,
> Steffen


