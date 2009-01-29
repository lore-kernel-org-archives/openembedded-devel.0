Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1LSSDv-00050G-Dt
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jan 2009 09:26:07 +0100
Received: by yx-out-1718.google.com with SMTP id 4so3032853yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2009 00:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kIC2o0txYnq2Zs7BKwCYaGUXYWd2U109PpbqfyaNhJ0=;
	b=Lp8Ku49UufYMK1x9HgrNjrG+NGH6a45/yGuYO5Pba9XXBCUb5Na2iUneroXtomRAX/
	XwSKJ9FN6HYapHtIuB3lbvm/xDCJx9Kq6AOM81xjoyg/OJ8PK5or8omDw5XGyvN9ciYB
	mU9kUcMa49NbKi8zcaoxI7PnFJmjXwEkuUVwA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Lq4Zj+z/MJvsPWMhXFRlqinAcXLZIfJtxqJmdN97BQu78i3laJUhb+jFvK7APCpnIN
	t7jZTAkWLDk+7HZy7hA6C79yrS6iTN7jq1jxo25piNyKEdyF/NqhKPG7pWzonDoZ0vl5
	psjWYzFx90iIcb3bfhyOJVCSmY/8tj6QW3GH4=
MIME-Version: 1.0
Received: by 10.150.138.1 with SMTP id l1mr2847521ybd.241.1233217107132; Thu, 
	29 Jan 2009 00:18:27 -0800 (PST)
In-Reply-To: <48239d390901282324j203a7111i6993ee223c12e109@mail.gmail.com>
References: <48239d390901282324j203a7111i6993ee223c12e109@mail.gmail.com>
Date: Thu, 29 Jan 2009 11:18:27 +0300
Message-ID: <48239d390901290018k381749e0m12f40375bcf6babb@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: maintainers for wireshark/tshark, net-snmp, libpcap, tcpdump
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
X-List-Received-Date: Thu, 29 Jan 2009 08:26:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Thu, Jan 29, 2009 at 10:24 AM, Sergey Lapin <slapinid@gmail.com> wrote:
> Hi, all!
>
> Is there any maintainers for the following recipes:?
>
> o.o.d/packages/wireshark/tshark_0.99.4.bb
> o.o.d/packages/wireshark/wireshark_0.99.4.bb
> o.o.s/packages/net-snmp/net-snmp_*.bb
I have overlooked maintainer of net-snmp in MAINTAINERS and tried
contacting him.
other recipts are not listed there.

> o.o.s/packages/libpcap/libpcap_*.bb
> o.o.d/packages/tcpdump/tcpdump_*.bb
>
>
> None of these patches change normal use of tools, only adds minor functionality.
>
> So, if there's no objections I'll push this stuff, and if somebody interested,
> I'll send patches beforehand.

I have pushed these changes to separate branch, ieee80215.
It can be viewed using OE cgit:
http://cgit.openembedded.net/cgit.cgi?url=openembedded%2Flog&h=ieee80215&=switch
(patches in question are first four (3 by me and 1 by Dmitry).

Thanks a lot,
S.


