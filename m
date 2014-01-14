Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7C10A6DC93
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 22:24:46 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id uy17so6918090igb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 14:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=DatWsQ881HBdzH0Sa2wehzywjxYti0q2R/7ILTxXsQM=;
	b=UOhPUnh8x1TBdzCJaJrsZsmA+ULyeQS13DXye9/nXeY9/DArqLz9ZNuX2aws9UeV4f
	X+o9/e8o0PHmbcpBLkIvMaUnQH00SAY6CS2gj8K/bHEJEvKlE0bd4IS+dvOI+xSU/kxq
	fdf5nnD2brbN95moZJLhIEcceRGTgmwxeSQL2b+tjRqVPYwJc2btUUvoicz1acL2TDgY
	J9JhFNnxRNFkuMwVqvKA20wn7kTvYT0SM5IsSdHPDIPGpgdAupWeaJcrDrGSqKa+cxY0
	Le3jWuEgfIVDI/Ll7dJOEWmtlyA7b/ZywPDV4e+PL3CqWMmuRSXQDjbyNcJYz5fDqmnQ
	199A==
X-Gm-Message-State: ALoCoQlmR7hWjNfP7CfoDnarPDGQEbZGNoySzJX19nC3pDvAsQVleuON5GifFfBC+TruSE/y+9nT
X-Received: by 10.42.40.83 with SMTP id k19mr661352ice.3.1389738287306;
	Tue, 14 Jan 2014 14:24:47 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id d18sm26118572igz.0.2014.01.14.14.24.45
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 Jan 2014 14:24:46 -0800 (PST)
Message-ID: <52D5B92C.5040001@linaro.org>
Date: Tue, 14 Jan 2014 17:24:44 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
Subject: ** bug squashing weekend - Jan 17 to 20, 2014
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jan 2014 22:24:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello all OE/Yocto enthusiasts!

https://bugzilla.yoctoproject.org/

It has been noted that the number of unresolved issues in our bugzilla
has been rising which, if left unchecked, will lead to an
ever-increasing bug count. In an effort to raise awareness of the number
of unresolved bugs and work to reduce them, we'd like to plan a "bug
squashing weekend" for this upcoming Friday to Monday (January 17th to
20th, 2014).

If you work with OE/Yocto during the week then you'll have two days to
look at issues, or if you have more time on weekends you'll also have
two potential days for this activity.

It would be nice if anyone involved in OE/Yocto could take some time
between now and Monday to have a look at the bugzilla database and
consider contributing towards reducing the number of opened issues.
Obviously if you're a maintainer or some sort of a developer there are,
most likely, obvious issues you could consider addressing. But there are
also lots of issues an OE/Yocto "user" could investigate as well -- for
example there are documentation issues, there are several issues in the
"NEEDINFO" state, and sometimes just being able to reproduce a bug (or
not) and confirm (or not) that an issue can be demonstrated on more than
one host can be valuable information for the person who does eventually
get assigned to solve the problem.

Please take the opportunity to have a look at the opened issues in the
bugzilla database. If you don't have an account, please consider signing
up. Play with the "Search" capability (you'll probably want to try an
advanced search,
https://bugzilla.yoctoproject.org/query.cgi?format=advanced) and see if
there are issues to which you might want to contribute.

In an effort to keep multiple people from working on the same issues
during this sprint, please let the community know on which bugs you'd
like to work. You could reply to this email (keeping all the mailing
lists CC'ed), and/or you could re-assign a bug to yourself.

There are usually plenty of friendly, knowledgeable people around who
can help. You can use the mailing lists, IRC channels, or bugzilla
itself to communicate.
https://www.yoctoproject.org/tools-resources/community

Thanks for your participation! :-)

https://bugzilla.yoctoproject.org/

