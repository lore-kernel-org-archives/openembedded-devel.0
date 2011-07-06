Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1QeVfn-0007Fq-Ht
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 19:14:03 +0200
Received: by vxa37 with SMTP id 37so107336vxa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=6kEsGD659f/+Z5aIXXbACLkFcvVEdD/lzUBoFot9cZw=;
	b=wcXcStK09wa4Pv99gxzqzt/mHowACfsLRIAk4bdJgbwxmTPjRC9JQ0kjvBRFKC1WH+
	ZhAxv5Ly6NxoRAwfPWHgdVstQVthv1FiuruOEs8rAZbLS8kHxbMzTqMSIP+pAEe0LAPl
	OMzKbLf/gXapnD9cyZ/nZtDcED0xtqwxFZ2gI=
MIME-Version: 1.0
Received: by 10.52.100.70 with SMTP id ew6mr1456804vdb.66.1309972212310; Wed,
	06 Jul 2011 10:10:12 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.52.165.232 with HTTP; Wed, 6 Jul 2011 10:10:12 -0700 (PDT)
In-Reply-To: <4E14370F.8080508@flatfrog.com>
References: <4E142E2F.6040101@flatfrog.com>
	<20110706095258.GA2230@mail.familie-heinold.de>
	<4E14370F.8080508@flatfrog.com>
Date: Wed, 6 Jul 2011 19:10:12 +0200
X-Google-Sender-Auth: CRcjQ-CE0pv6MPv01xMTmORHkm4
Message-ID: <CA+2YH7uBNyM_z3H3=VdXU=ywbxGHeuck=E0uH-tByo-due_12Q@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Discouraged kernels 2.6.35+?
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
X-List-Received-Date: Wed, 06 Jul 2011 17:14:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 6, 2011 at 12:21 PM, Orjan Friberg <of@flatfrog.com> wrote:
> On 2011-07-06 11:52, Henning Heinold wrote:
>>
>> If you are needed to use the dsp you have to stick to .32
>
> Are there DSP-related packages that don't work with later kernels (dsplink,
> codec engine) or something else?

On an igep board i've tested gstreamer-ti and gst-dsp with kernels .35
(from igep git) and .39 (linux-omap_2.6.39 with custom configuration),
no problems so far.

Enrico


