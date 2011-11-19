Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1RRjbR-0007GH-Oo
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Nov 2011 13:01:01 +0100
Received: by yenm2 with SMTP id m2so1856267yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2011 03:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=58b4Bf4ZXql0WvCA2xwWwvNOLhprOtsFsImIGlhapEA=;
	b=Z51M5CaaggPJ/ffQIlZhJxrGpXITXe+Hjs0tb4LP6cgcmpZU7KtFh+XFF/35pML75I
	eFS3XSu1bGa6RmRvORKOO7DzyMpe45Xi6lMNbKrJIaZaZ6rvVFY34f+wBayEpG4RE13A
	N9jQc5XPNelQ7UVAXtyAHZbTzR8JoNMwuKtX4=
MIME-Version: 1.0
Received: by 10.101.17.2 with SMTP id u2mr1632710ani.34.1321703670904; Sat, 19
	Nov 2011 03:54:30 -0800 (PST)
Sender: ebutera@gmail.com
Received: by 10.236.191.228 with HTTP; Sat, 19 Nov 2011 03:54:30 -0800 (PST)
In-Reply-To: <CAFU7RzPxXLOA2FUQC7v-VuOmZ_G6_5gwokHy4vNt_WB-pcOn7g@mail.gmail.com>
References: <CAFU7RzPxXLOA2FUQC7v-VuOmZ_G6_5gwokHy4vNt_WB-pcOn7g@mail.gmail.com>
Date: Sat, 19 Nov 2011 12:54:30 +0100
X-Google-Sender-Auth: 6KtvOzgRC2CPNuLJ6W-KiKKZrcM
Message-ID: <CA+2YH7vOgQuAjo6gzXrGmzUSy6FWC_9HmC723r8CcTgf2xiygw@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: openembedded-devel@lists.openembedded.org
Subject: Re: dm3730
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
X-List-Received-Date: Sat, 19 Nov 2011 12:01:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 19, 2011 at 9:06 AM, Raffaele Recalcati
<lamiaposta71@gmail.com> wrote:
> I'm sorry for so easy question!
> It seems that if I compiling for beagleboard I get a 2.6.39 running
> also on dm3730 cpu.
> It's not clear to me how can dsp codec work correctly at the same time
> with omap3530 and with dm3730.

If i'm not wrong the dsp is the same, just running at a higher frequency.

Anyway i use the same codec server (cs.x64P) on omap3530 and dm3730
and it works correctly, i tested h264enc and mpeg4enc.

Enrico


