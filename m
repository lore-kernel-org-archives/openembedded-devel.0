Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OHjs2-0003Qt-6D
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 22:40:03 +0200
Received: by vws20 with SMTP id 20so411421vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 13:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=D6676NXTcx7WeCifSi/AtcjGxfcAssaMDYj6MQd2W0E=;
	b=JDo+odRHaiwvGp6BS09r1HeZ45B4j5YVTVYXWyd33KYLU2ENARzhl/5WKB1KDarRrB
	gGvxKGRBVBPSzugPntHZEYbnC44gUaMCX5Q+a6vNfy/UquN2XlyXj3W8M5nhzN4boI96
	ZEhHfW3QEdqq0MIzEoPfiAjcx/IauqhXoF3O0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=xcJmPKYyfqhl85ScB1YARehRt35/xp++1qfsZ1xHDAhRQYIBVokwDi/IBh1CuLiy6d
	SxvCPHUgnWfDWB1hilJ6O/si8IjkA8gImxgvGlWGrirfV/goGY4vfo1VugEIrcOTdbKV
	kVLnJkptbJA1dgoGuoSgLV3HE/7mNizmsM85Y=
Received: by 10.224.106.4 with SMTP id v4mr6275070qao.36.1274992552159; Thu, 
	27 May 2010 13:35:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.217.136 with HTTP; Thu, 27 May 2010 13:35:27 -0700 (PDT)
In-Reply-To: <20100527203244.GL23464@denix.org>
References: <20100527203244.GL23464@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 27 May 2010 13:35:27 -0700
X-Google-Sender-Auth: lFBfTCObsYuj1mubE5ajr-dSp-4
Message-ID: <AANLkTinme5hT1I2WS5ZLB859Ph25-VwjF0TKklz2TyUy@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Commit access for Enrico Scholz
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
X-List-Received-Date: Thu, 27 May 2010 20:40:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 27, 2010 at 1:32 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> I'd like to recommend to give commit access to Enrico Scholz - he has
> submitted number of useful patches, fixing issues in core areas, some of
> which
> were hard to find. He has demonstrated a good level of understanding and
> knowledge in system, Python and bitbake areas. He is also open to feedback.


+1
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

