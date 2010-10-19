Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1P8FZr-0008Fl-S7
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 19:02:20 +0200
Received: by eye27 with SMTP id 27so6281eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 10:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Q+QCBD/Txz9hzmyWk7rE6K7/hfqaSopb/6duPbQofpI=;
	b=aLfoPBGSsK8jwPmXHwQqeGL2fvnABBE4ekCbBSLCdFcBAtgP/qDYh5TvJ1d9EUl61b
	TWpjHrGg4N40UTfpmmGNDvG//B0qNj1nkQ5OIigtshdhL8wtTqOJ8qGyrvTrXgw0c2xF
	1cQErcse/t9vqRFMIMfnSGmHvbEyC/df34xfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=wu31CuFQuNlwAMcR/vZYjNylfdUpn7FBrHWj+obFp58b89pPZCJwX/U+opDfasCarb
	1qkgxFMybf3i29I5EsZYgRLvMjGG9tfhc0Nn+Lh5t6LgUT/5Zuf1g/zT3rizjvlJHDX9
	efOD8UuSIBvUx0u1u3my0ReCl4OEJtbxnxrJ0=
Received: by 10.213.10.136 with SMTP id p8mr910477ebp.40.1287507705174; Tue,
	19 Oct 2010 10:01:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.127.137 with HTTP; Tue, 19 Oct 2010 10:01:24 -0700 (PDT)
In-Reply-To: <AANLkTi=BRC8V5VRWuBKac750eoS79eeBtaiyDOYGwzgo@mail.gmail.com>
References: <AANLkTi=BRC8V5VRWuBKac750eoS79eeBtaiyDOYGwzgo@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 19 Oct 2010 10:01:24 -0700
Message-ID: <AANLkTi=fiMQULYAZsB+CKDeFFf9esmDRruER72F6QsvY@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-gumstix-2.6.15 & gumstix_2.6.5-gnalm1: removed outdated recipes
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
X-List-Received-Date: Tue, 19 Oct 2010 17:02:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 19, 2010 at 12:11 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Ash, do you have commit access, or does someone needs to push this for you?
If someone could push this, that would be appreciated.

Actually, I'm a little new to this: what is the life-cycle of patch
once it lands on patchwork?
Thanks,

-Ash


