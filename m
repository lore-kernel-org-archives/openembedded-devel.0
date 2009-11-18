Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NAnas-0001y3-K1
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 17:41:25 +0100
Received: by yxe5 with SMTP id 5so1185961yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 08:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=3pfKozlJ3Dk/fZ9c8j0w0uxA9h7hX2kAb1Qd/HpvEsw=;
	b=Y9zYy2LEYgH6yoBHzgjABMqeL3yFUnA0Nv/TdAj7aMwH99aDwDa+Lr/FGjanF1sYQF
	vhrx5v259G/ODvFHKKshHvaE3UIZGb7pcjKai+skpAfo0Z4vj/d3JC/CKk2R3YoGmVw2
	jAr/A3RrFZt21Wly7Snx0mK+nHccWQE1yAXQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=v8pNjArF+Hr6/ANL/qcHoCX1Xaqhcjllr/5kScv8Ov541jNMjBm6RmY3fyJD6sKtpF
	FuUJ6ietTRkH5rquSOdY7o1q70Bhd5cZ/jRBdyf4lXd3dgTG3xIYKUAOUcRFapPvn2a+
	9B0bzvc9zJSPmbNoxUsHpfo00rak85aGt06Wg=
MIME-Version: 1.0
Received: by 10.239.163.207 with SMTP id q15mr1155276hbd.65.1258562397353; 
	Wed, 18 Nov 2009 08:39:57 -0800 (PST)
In-Reply-To: <4B03F539.9080806@cs.put.poznan.pl>
References: <1258504066-24834-1-git-send-email-leon@sidebranch.com>
	<be7a9f3d0911180510p6f359154ve1c6219ca8ac0f4c@mail.gmail.com>
	<4B03F539.9080806@cs.put.poznan.pl>
Date: Wed, 18 Nov 2009 17:39:57 +0100
Message-ID: <c384c5ea0911180839g23cbc1e5u2fd17876f1a2cdbf@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] kernel.bbclass: Move do_menuconfigure after do_configure.
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
X-List-Received-Date: Wed, 18 Nov 2009 16:41:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Wed, Nov 18, 2009 at 2:23 PM, Przemyslaw Wesolek
<przemyslaw.wesolek@cs.put.poznan.pl> wrote:
> Otavio Salvador wrote:
>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> For not to make a confusion: this was already commited from the other patch.
>
Indeed, I removed both entries from the patchwork queue.

Thanks for bringing it up.

Regards,
-- 
Leon


