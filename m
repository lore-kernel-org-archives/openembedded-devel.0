Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JtoQx-0001qk-6F
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 May 2008 20:32:07 +0200
Received: by an-out-0708.google.com with SMTP id b38so89695ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2008 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=HhRJeSDLLotmzh5FWszInFo9aA71mHbuxlp4LU8Blwk=;
	b=WmDDVAKEAHvQPRCMP8kK+DQDZycJMFd8yVbTHwXrRPnkhtS2gMeICZtkCRun9befRxxCHOrWakzz5eoje93ujGag4v4qKEToDVfQTt0CQ6FjIWlulzDU38cw5ord6YNZuJvwcegIubOI6Z8HASCwG+CarMpvQuExT7C9EdnW1xA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=qPaL55twpkyOl4gAkc84qSmUM1eZTFm3NxF8qlNub/Gs2e32HRalk0RMCf9mQP7OO0HMewZu6LtaRUpLqcjVBt4A7wR/S9vGkGg26P0ro8JVampzM6unPnKhqnvdNEj94kwdi/AAjKCETAnaxKM2YIrOCr8crbGMVHBxVmrDrVk=
Received: by 10.100.5.16 with SMTP id 16mr3228176ane.102.1210185092373;
	Wed, 07 May 2008 11:31:32 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Wed, 7 May 2008 11:31:32 -0700 (PDT)
Message-ID: <c384c5ea0805071131u7f2b8891m8c82c35bd7912991@mail.gmail.com>
Date: Wed, 7 May 2008 20:31:32 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <35a670560805071002s729efe6j4fe66f792f160132@mail.gmail.com>
MIME-Version: 1.0
References: <35a670560805070733s30f077dcu92729e5f2356f0c1@mail.gmail.com>
	<19c1b8a90805070921j7e4355a6vd2ff2bb4649e3a25@mail.gmail.com>
	<35a670560805071002s729efe6j4fe66f792f160132@mail.gmail.com>
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 07 May 2008 18:32:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Matthijs,
Hello Matthijs,

On Wed, May 7, 2008 at 7:02 PM, Matthijs van de Water
<matthijs.van.de.water@gmail.com> wrote:
> On Wed, May 7, 2008 at 6:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
>  > any compiler ICE is a compiler problem. You can reduce the testcase and may
>  >  file a bug in gcc bugzilla.
>  ...
>  I'm wondering what exotic settings I'm using that causes this.
> ...

*Any* compiler ICE is a compiler problem. :-)

The GCC people may be interested in your (exotic or not) settings and
a test case.


Otherwise, this bug may be lurking in there for quite some time.

Regards,
-- 
Leon


