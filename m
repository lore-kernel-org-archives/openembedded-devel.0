Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M00P1-0007fx-Hr
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 May 2009 23:36:15 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1643817yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2009 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6cFyM27D5fEd1cjscNM4I1NC9dP+KwOsm8EoC9lGQG4=;
	b=achalfYOxMmmirXCqZUkK+VXQyKVjRImGkYT4kxEUpMqPEokC0mfyMnn6SqIQrTSG2
	mTBsWF2X8+2OL/is5tEcSafU6XC12basK9pmbFfAmndfTbyWOTig1AGg/FWV+3Vj57ez
	4l36tDHSKd4Sny7xcVtnd6UhmLGJsj5qyKZH8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YJROyW6IbRgYC7SZEyXTOHdLAKzRyYdsIMzCiUgr4ESSTGXC6VWT+IVo44svrXD2aT
	7zG6abMRZb7JlCCA8T9DpMHV5sQvd8gR6eRrYhOYplaqGPSFuFDwY8bIZz8nYpsiWCZV
	q7cF/51bcafHguUc57Qdo156RtHC306dYFSko=
MIME-Version: 1.0
Received: by 10.231.17.74 with SMTP id r10mr2615528iba.13.1241213444069; Fri, 
	01 May 2009 14:30:44 -0700 (PDT)
In-Reply-To: <49FAE94F.2090101@doredevelopment.dk>
References: <49FAE94F.2090101@doredevelopment.dk>
Date: Fri, 1 May 2009 23:30:44 +0200
Message-ID: <c384c5ea0905011430h57c5165bp6d455fc47ada91@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFB1bGwgcmVxdWVzdCBmcm9tIERvcsOpRGV2ZWxvcG1lbnQgLSBOZXc6IE1pY3JvIGRpc3Ryby9pbWFnZQ==?=
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
X-List-Received-Date: Fri, 01 May 2009 21:36:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Fri, May 1, 2009 at 2:21 PM, Martin Lund <mgl@doredevelopment.dk> wrote:
> git pull git://dev.doredevelopment.dk/oe-micro.git master
>
> The "Micro" distribution/image is created because we feel that there is a
> need for a truly tiny and clean distro and image definition in OE for those
> users out there that needs a _very_ tiny Linux rootfs with virtually nothing
> installed except busybox, libc, udev, and a few init scripts. On arm the
> jffs2 image size is only 1 MB (uclibc based). No bloat allowed.
>
Agreed, this is more or less what I use OE for work-related (read-only
Linux based firmware image).


> We intend to maintain this distro/image in the future - please pull :)
>
Or you planning to directly maintain it in the OE upstream GIT repo?

I guess with the amount of ACKs now anyone can pull and commit;

I'm not sure what the exact GIT workflow is for such a pull, anyone?

Regards,
-- 
Leon


