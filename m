Received: from [66.249.82.231] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KJEGn-0007qO-PO
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jul 2008 23:10:41 +0200
Received: by wx-out-0506.google.com with SMTP id i29so2763471wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2008 14:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=QFKBODUAVoJ5W/5HDYNk56hTx0xfnn0Md0RdXgX6fOY=;
	b=rkg8BuuprqgUCpnmJjGl9sYySS00UN+8l6bTavLZgQ/RDhQD+HlI3kS98ZZeoF1QNK
	npIA0Q6wMmUT4Ndt3AwNXcgkXpBiqgspgtXH2zbLxyN6b80lTKfCywB2KDNBL8bjmN9D
	84Rt1OlAgFUqP2x3urC7dJyXWqBJD/h8mytGg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=pv7L4K/GynHvxD6mX0wYi7Kv28hxKw/izxC6crVZjMRrcs/OMtIz9YmhhXJTEqpzLi
	SJhE7WiWbp3eD7GAoBvc8WPC2M9oOQ7msIVpwongwXAWQLrK88GK1xkfDvyncJJhXWWq
	g983wMlLwp9+H1rS3DCCwa2n4zR5AyNAdxaqs=
Received: by 10.100.226.6 with SMTP id y6mr2827531ang.115.1216242583542;
	Wed, 16 Jul 2008 14:09:43 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Wed, 16 Jul 2008 14:09:43 -0700 (PDT)
Message-ID: <c384c5ea0807161409w6cad679dp4e1ef3820b36666e@mail.gmail.com>
Date: Wed, 16 Jul 2008 23:09:43 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g5kbqa$but$1@ger.gmane.org>
MIME-Version: 1.0
References: <735693612@web.de> <g5kbqa$but$1@ger.gmane.org>
Subject: Re: squashfs-lzma bitbake recipe needed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 16 Jul 2008 21:10:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Wed, Jul 16, 2008 at 10:34 AM, Rolf Leggewie
<no2spam@nospam.arcornews.de> wrote:

>> The most important ingredient for this to work is the use of the squashfs filesystem as the storage format as I did not want to create just another file format.
>
I have used squashfs-lzma with OpenEmbedded for years now, mostly on
IXP4xx platforms.

I didn't know it was special, but it might be most of our kernels do
not have the patches in place, so thanks for any pointers/work there.

Really, squashfs-lzma should be mainlined.

Regards,
-- 
Leon


