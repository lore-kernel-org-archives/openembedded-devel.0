Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <linuxfpga@gmail.com>) id 1LbN6h-0006Gl-C1
	for openembedded-devel@openembedded.org; Sun, 22 Feb 2009 23:47:31 +0100
Received: by yw-out-1718.google.com with SMTP id 5so583630ywm.30
	for <openembedded-devel@openembedded.org>;
	Sun, 22 Feb 2009 14:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=HfylkTJQ2ziT/PTkA8XyYhU7qH5swoHsOd89Q8FTgaY=;
	b=MlAaziwY33CbadufWrsWV50aXT8P05OeknpgOtZHjCLy5h7bAaG8FKAoxQYeqnnR6C
	K/EZXLdWEaa5b1AOL+da0PiTgppvkD/3HiuDQJ1JpVXoVBKQnT1hXK8hjRMTh/5bTlpL
	2JM6RiJx40c5i1SJ/AfVeold6lqPYZwjenE50=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=l5VGSSWKSbOBm9GBNwjFqoSfLm33nNwl5Q/jk+ePYTGbDSwa1bh+ML6+rjxM7+O7TD
	cmKJFfnqbLTfexTjSeEiV4l62YZo77Cx/vz64Z+dQ0TOoHMS0orE6LmHHHGX8J+YuCRu
	+ym+ForwaN5dFuvOfs1sbpuBvZ8zSwJXyLz1c=
MIME-Version: 1.0
Received: by 10.220.94.137 with SMTP id z9mr485603vcm.52.1235342683942; Sun, 
	22 Feb 2009 14:44:43 -0800 (PST)
In-Reply-To: <gns8g9$4tg$1@ger.gmane.org>
References: <d741b6090902221034t224cd1e5ja6b3e863fd54bbda@mail.gmail.com>
	<gns8g9$4tg$1@ger.gmane.org>
Date: Mon, 23 Feb 2009 01:44:43 +0300
Message-ID: <d741b6090902221444u49d25697n3e51d7e54fa03f81@mail.gmail.com>
From: Alex Williams <linuxfpga@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Angstrom, ep93xx, broken rootfs
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
X-List-Received-Date: Sun, 22 Feb 2009 22:47:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> That should be solved now, thanks for spotting!
> /me grumbles at += vs _append " "

Now everything builds fine! Thank you for lightspeed reaction on this
problem! =)


