Return-Path: <sledz@dresearch-fe.de>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7723866007
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 07:15:11 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q59so6198677wes.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 00:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7j0mRiNIR4Gl0wuLxsuK9dd6WDRth7vXSzoGu4no7F8=;
	b=nJ9gfYHzQ6kwWY6MCZ5UIlazR8rDIxrv61+/w30Zp46d85cwk1hSL/aOost8ijNDgD
	fYvdTP7oFns7PAgOHSbdUB2L/JVhTyzjLyx0P7tGZtQV6xDr62ikOSp9PsZ2ggvMz5Ln
	SI1toR1PL/Qh/JY7VV6meLM8lPhL8dsKkw2lpO1MQLAFUsJ/PvPyt7lCQ+of14+DVtTq
	h8qfM203xdgRZTwXP1+lI1nQQsLTyzR9fSqCIwV5+GqAzo6aJI9oju23gDL6JDWYftlp
	4RlFxgSSO6SYmjGPKVP5R8vrbltTZIoMwCxbAY7AfKLqbVJHYPNg/xp81PHNah5Aj3cB
	CvCw==
X-Gm-Message-State: ALoCoQmRvYqLTvB7Q70LQf4+7NtRAcTQ/BfbSUVkSAoAtoZSOyFalepxDr82EqJTOEwsLi4+gV3X
X-Received: by 10.194.157.195 with SMTP id wo3mr788403wjb.130.1403507712161;
	Mon, 23 Jun 2014 00:15:12 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id h13sm28235276wjs.2.2014.06.23.00.15.10
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Jun 2014 00:15:11 -0700 (PDT)
Message-ID: <53A7D3FE.30309@dresearch-fe.de>
Date: Mon, 23 Jun 2014 09:15:10 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20140430143741.GL2486@jama>	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>	<20140505164514.GM2486@jama>
	<536A7C42.6030502@balister.org>	<20140511145337.GE22774@jama>
	<20140616134850.GP2428@jama>	<CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>	<CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>	<CAP9ODKr1QTT++D-iiAwT5LgftiZdmzT34xMM_2dkHF5Ti99KnA@mail.gmail.com>	<CAOd_LFz4ArrStfheb4+KKhwhWPDft5BYjqNk7Y05Ja=oDk+ZSg@mail.gmail.com>	<20140618142125.GJ2117@jama>
	<CAOd_LFxAsqciQfwvwmsHxwxSd7=4A27y2-tWqETU0GTBBG2ZGw@mail.gmail.com>
In-Reply-To: <CAOd_LFxAsqciQfwvwmsHxwxSd7=4A27y2-tWqETU0GTBBG2ZGw@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Mon, 23 Jun 2014 07:15:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 18.06.2014 16:34, Cliff Brake wrote:
> On Wed, Jun 18, 2014 at 10:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Wed, Jun 18, 2014 at 10:04:52AM -0400, Cliff Brake wrote:
> 
>>
>>> Otavio, Armin, would you like me to add your emails to the maintainer
>>> lists in these readme's as well?
>>
>> Should I wait 1 more day before merging branch above for possible
>> maintainer additions?
> 
> Yes, that would be a good idea.  I'll send a pull request tomorrow, or
> after I hear back from others.
> 
> If there are other outstanding daisy patches, please let me know.
> 
> As far as a procedure to merge changes, I propose that initially one
> of the branch maintainers sends a pull request to the maillist .
> Another maintainer ack the pull request, and then Martin (or other
> main branch maintainer) merges and pushes.  This will initially give
> us a little bit more review.  Eventually we may transition to one of
> us pushing changes directly after co-maintainer ack. The goal is
> obviously to keep daisy building and as stable as possible.

Ping!

My live555 patch is still waiting. :(

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

