Return-Path: <net147@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id D38FA6F1BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 03:14:31 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f51so4089664qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 19:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Rp1cm45+o2mmvWZG1K2dVs62MPMJgDWPOl/D6X+dRq4=;
	b=uVnkQOMjhmf3LmwwmNZCBdTQeNmlvOFeReoxn21YLEX67EYwAlRad2UFkljl6l9gh+
	+H2lsiKhfnaK7cyCs5SACeNvx1T6Il1yyEjSrR5hHkJzy4kdh7MI7vwNA6iV8xvsMEN5
	sp4XqWn6Mjwyg+4by96DcEp0odXJinmUfyLELxRGdDR/HnnL+ddHuzLVbUnjquSG82xQ
	/8o6HI0oPPput1/Nzsc3PSGfx9q6V9+u4SLX15TnCQahXwabX336DBJVAPAXwY1pIR+j
	3DVh/fls0/POP5NHXGfmVePjRbSfBBHXnRWN8LaFrCnO9XdUR69WXmxVVlZThVzwT4rk
	wz1Q==
MIME-Version: 1.0
X-Received: by 10.140.48.165 with SMTP id o34mr4206917qga.16.1393470872087;
	Wed, 26 Feb 2014 19:14:32 -0800 (PST)
Received: by 10.96.78.193 with HTTP; Wed, 26 Feb 2014 19:14:32 -0800 (PST)
In-Reply-To: <D645A4EC-AEB7-4C81-B46F-ED2B29A92125@gmail.com>
References: <1393466798-13105-1-git-send-email-net147@gmail.com>
	<D645A4EC-AEB7-4C81-B46F-ED2B29A92125@gmail.com>
Date: Thu, 27 Feb 2014 14:14:32 +1100
Message-ID: <CANwerB1YP=Ymq2frpOqYpTX-+4oDmQJNrNogJ7=Jcg7ZgYricQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xterm: split out resize into a separate package
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
X-List-Received-Date: Thu, 27 Feb 2014 03:14:33 -0000
Content-Type: text/plain; charset=UTF-8

On 27 February 2014 13:08, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Feb 26, 2014, at 6:06 PM, Jonathan Liu <net147@gmail.com> wrote:
>
>> +FILES_${PN} += "/usr/lib/X11"
>
> why is this hardcoded

It was originally like that. I have sent a V2 fixing it.

Regards,
Jonathan

