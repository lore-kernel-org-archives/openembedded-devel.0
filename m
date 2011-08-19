Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1QuSxM-0002sY-Ud
	for openembedded-devel@openembedded.org; Fri, 19 Aug 2011 19:34:09 +0200
Received: by vwe42 with SMTP id 42so2746203vwe.6
	for <openembedded-devel@openembedded.org>;
	Fri, 19 Aug 2011 10:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=9uviZYwlss57/B09yYg2A7wPLyinMI5K19M4o5Q9cN0=;
	b=Ml1PpvSSDq3gVRpZmAjFVjHQR6XjMTSluLPhzrHCiLHa5LlAkHJGDy/F8pGzifzaCQ
	Pi1uT4mYL8cXyUdR8pE6ZchM2PmvdfeHV2rfDTKZEyCqaWf4YlHcVdJAO9JYV3gwnNLf
	y34ILQSGQC7+KUSI8gO4WvtHdDETaztl6v5zw=
MIME-Version: 1.0
Received: by 10.52.69.78 with SMTP id c14mr2416838vdu.353.1313774967022; Fri,
	19 Aug 2011 10:29:27 -0700 (PDT)
Received: by 10.52.112.161 with HTTP; Fri, 19 Aug 2011 10:29:26 -0700 (PDT)
In-Reply-To: <CAMKF1sqqFkovwwLkjQ4pkndKgtmm-VdZupuubWSAURsmx3ArDg@mail.gmail.com>
References: <4E3A3C4B.8040208@dresearch-fe.de>
	<4E40FCA9.7060204@dresearch-fe.de>
	<4E439289.3050005@dresearch-fe.de> <1615282.kebj4eQ1MV@perseus>
	<4E44C076.90407@dresearch-fe.de> <4E4E28AB.8010806@dresearch-fe.de>
	<4E4E717C.2040506@gmail.com>
	<CAGDS+nm0mLkVnv3EKRYYA8d-uMwoedPq+N2Q1iXP_eyf8OUOVw@mail.gmail.com>
	<4E4E8152.5030500@gmail.com>
	<CAGDS+n=Fx-YYC6TbwWsM_xZEw4u0H1n5d8a0jMFwf1q+UZj+XA@mail.gmail.com>
	<CAMKF1sqqFkovwwLkjQ4pkndKgtmm-VdZupuubWSAURsmx3ArDg@mail.gmail.com>
Date: Fri, 19 Aug 2011 10:29:26 -0700
Message-ID: <CAGDS+n=_+JD6=QcrApdvTP-waSh1NOjF=nwOUvVuAA8aF5-h=w@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@openembedded.org
Subject: Re: [2011.03-maintenance] unsatisfied dependencies to libgcc
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
X-List-Received-Date: Fri, 19 Aug 2011 17:34:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 19, 2011 at 9:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 19, 2011 at 8:32 AM, Steve Sakoman <sakoman@gmail.com> wrote:
>>
>> Which do you think should be disabled?
>
> libgcc-dev

Thanks!  I'll do a test clean build with the generation of this
package disabled.

Steve


