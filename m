Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6CA8465D8A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 19:45:20 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id as1so385509iec.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 12:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=wcAvsAUSqwGOZ9Yrw6LtkhGknqlA9qQYd7+PZ3j6iV0=;
	b=DDC+3+bs6K3YDN0kNSsTLNFQhS/d2GhmhR6NjVUnOx4nzIAjowQxTWBuFRWwqD01Hn
	svAt24jfN99FrOfAJPkbIsN7l99AJhbDVooTaVVifMruZ/1jW9o2ZbRAiqqNPTGXm9AY
	wh3zpoHQWQ9/7aHu0ZHBMferK2EkGxBGZf3zfVXx3fjV7J43LxLUTkDhT0MtuJNj5Afp
	Y9RfO2p2GPXk9PKY62EkOxdrOHWEsU+ax3eNqJ/viROis9kMguxM31rLh7YjDTrK7FtY
	twvxXTTwsVAedWbfhDH1W2j2QivEDLI5iGBZvLE+fef6H7CfW8oLhMDPVJ3A+9UCpL75
	Et2A==
X-Received: by 10.42.64.131 with SMTP id g3mr14134345ici.15.1398541521777;
	Sat, 26 Apr 2014 12:45:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Sat, 26 Apr 2014 12:44:51 -0700 (PDT)
In-Reply-To: <CAPbeDCmCodtS+O8tBJwjGyhr0FsiWCd9Sffv9JGsU+p6J1EE2w@mail.gmail.com>
References: <ljcuj9$fuc$1@ger.gmane.org>
	<CAPbeDCmCodtS+O8tBJwjGyhr0FsiWCd9Sffv9JGsU+p6J1EE2w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2014 12:44:51 -0700
Message-ID: <CAMKF1soU-HAwBs1z8Y7T=r6PCOgdJsHNm=E1kgomveWLAsqxmA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5]remove -reduce-relocations on arm platform
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
X-List-Received-Date: Sat, 26 Apr 2014 19:45:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 25, 2014 at 6:02 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> I'm building for Wandboard, ARM Cortex-A9, but I haven't had any problems
> building qtbase.
> Is this more of a runtime bug ?

are you using Linaro toolchain ?

