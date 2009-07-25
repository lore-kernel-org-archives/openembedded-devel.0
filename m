Received: from [209.85.210.193] (helo=mail-yx0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MUi7L-0007p7-29
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 16:20:58 +0200
Received: by yxe31 with SMTP id 31so3853602yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jul 2009 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=AFg89szn3zvoSYzl5NNTUlnFzF4VkEZoBwKshVcv7VA=;
	b=hcwyfFKVOF7ZcqtvyTEUIRG66a38gp22JI5lM85tST9V2EX2BnMD52N1l3SmBBxtlZ
	j0jd7rRwaTPIekAkVQngjutTQZXBA9FDDC3n+KN+haGsa81aGxeC+locbrfgfZ7TrYFC
	c62JrS8BW95C0HvchaGLBpbge+vyW0WXmk7gI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ID8Jfiz0oFSUEA+Mxbg1eIgiSvglZDqxNPi7lUL6HXg8Qz8LK+R9x6NaZMnFFZzTqK
	LPKrkw9XOSsKsPPOVaNDGuKik4MsEdXcIELcdYsZtuOox9qKK54Rq3R81ENY/UkkcHtp
	uCqjoGeULDCt9OQ3byEa5HkSbMl7Ln27cZXWU=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.142.19 with SMTP id p19mr5913345and.13.1248530784521; Sat, 
	25 Jul 2009 07:06:24 -0700 (PDT)
In-Reply-To: <20090725090719.GA4800@dodger.lab.datenfreihafen.org>
References: <20090722195130.GE5337@dodger.lab.datenfreihafen.org>
	<20090725090719.GA4800@dodger.lab.datenfreihafen.org>
Date: Sat, 25 Jul 2009 11:06:24 -0300
X-Google-Sender-Auth: cfb82137a1c0a0f3
Message-ID: <be7a9f3d0907250706p451d8f87pd8fca6f6ebb76bfc@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] fakeroot: Add 1.12.4 as 1.12.1 is now longer available on debian mirrors.
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
X-List-Received-Date: Sat, 25 Jul 2009 14:21:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Sat, Jul 25, 2009 at 6:07 AM, Stefan
Schmidt<stefan@datenfreihafen.org> wrote:
> Hello.
>
> On Wed, 2009-07-22 at 21:51, Stefan Schmidt wrote:
>>
>> Fakeroot 1.12.1 fetch fails as the debian mirrors now longer carry that file.
>> 1.12.4 is still available, use this.
>>
>> Comments? Fine to commit?
>
> Can be ignored now. No comments, but Otavio commited the same fix.

I didn't see the commit; I did it while hacking our first ltsp based chroot ;-)

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


