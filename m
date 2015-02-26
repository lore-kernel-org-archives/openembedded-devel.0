Return-Path: <net147@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 237BD71637
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 23:59:16 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id i50so11693801qgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 15:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RWLMEOW3AhP/mtn1CWjQ3ADBp1DYi6qX/kQEY2wx+vg=;
	b=EfBG0zcuEeGVC3UjncFSXfpSHMcUp5x7HX0WHTvStd2RQJSNpj8OxG6DXOrt/v58Zr
	u/i1ksf+a8OkK4cl5ZLtjRcsq4s3rn6SV5He/A6IbHi6BThPlSxbDg86IweN8JszG7sA
	bdTBNwE+IUPedOOAHIbDQlB9N02pRoNCAhnNwomNKOEUbaXq/EwFPdPMMm3Fb5Ow76B8
	3geEzCSt0PmoYHESTJOkW1Sl3UFeVke2HujadA7TBhE6RqyTQCEAg/JOa5lZVjPLnqIk
	GA189oQmhKH2jFdG/U4rXpxmG0zDNOYM7YlsWMJ63pwaIZCuRhHfEL8N2osf0BnEi8KY
	Nv4A==
MIME-Version: 1.0
X-Received: by 10.140.238.139 with SMTP id j133mr24635063qhc.26.1424995157688; 
	Thu, 26 Feb 2015 15:59:17 -0800 (PST)
Received: by 10.96.56.100 with HTTP; Thu, 26 Feb 2015 15:59:17 -0800 (PST)
In-Reply-To: <4018372.oWEBFrtGCE@fridolin>
References: <4018372.oWEBFrtGCE@fridolin>
Date: Fri, 27 Feb 2015 10:59:17 +1100
Message-ID: <CANwerB112186snMnVL7i_3KfZe+qDTV38OA2iH2-wzEGGn-d6Q@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] recipes: upgrade from 5.4.0 to 5.4.1
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
X-List-Received-Date: Thu, 26 Feb 2015 23:59:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi Stephan,

On 26 February 2015 at 23:30, Stephan Binner
<stephan.binner@basyskom.com> wrote:
>
> ---
>  conf/distro/include/qt5-versions.inc                        |  4 ++--

Missing Signed-off-by line.

Regards,
Jonathan

