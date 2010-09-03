Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OrRls-00060Y-1b
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 10:37:18 +0200
Received: by wwi14 with SMTP id 14so38600wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 01:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=V+1j1kKw6zkjqNnihoiiag906gaa1VN+ek2q4E0Gdvc=;
	b=c/uis+bEaroE/2q7phoddEJjCKKpK/DXO7kpoyUXkv1UZeIOVo05GhKz+UX7/1JHTY
	Lk0zgQGOkmOWkAdszKop9A8HQ6vlq18BPRzVAeUAfliPnw0iiNChDCGnCxy6J5sRbYNn
	PKkD4z1ilYVR1hhL3hJB5iCeFYaSFIJI4jBCo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fiVoDxMNe80GI9uK8Kye8r28ycGaLhNRqAfheSveL/aApaJbn/O4o17LffjAUjtglh
	Ie29llbubU3pOAQ9AUJIyl74MX+WRTqu0XEoJo7S7uayfPDgDgK+0NqB+6tl4EC2cZov
	r8xbkoeqr7JTk8EFaOsferYTVGXkdxgdltiPA=
MIME-Version: 1.0
Received: by 10.227.133.139 with SMTP id f11mr344035wbt.132.1283502989968;
	Fri, 03 Sep 2010 01:36:29 -0700 (PDT)
Received: by 10.227.142.79 with HTTP; Fri, 3 Sep 2010 01:36:29 -0700 (PDT)
In-Reply-To: <AANLkTinhxdSG3M3ddEa6Bgtbkp4Pg8H5MSxkUAgWGZUk@mail.gmail.com>
References: <AANLkTinhxdSG3M3ddEa6Bgtbkp4Pg8H5MSxkUAgWGZUk@mail.gmail.com>
Date: Fri, 3 Sep 2010 10:36:29 +0200
Message-ID: <AANLkTim_3ROst4tmPrxJhxDwi+9K4mprMSAbq0g4sqRB@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git issues
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
X-List-Received-Date: Fri, 03 Sep 2010 08:37:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Thu, Sep 2, 2010 at 2:59 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
>
> git clone git://git.openembedded.net/openembedded openembedded
> Initialized empty Git repository in
> /home/frans/workspace/Linux/openembedded-test/openembedded/.git/
> fatal: The remote end hung up unexpectedly
> make: *** [all] Error 128
>
> Also I notice that the transfer rate is about 100-120 KB/s
> I seem to recall Leon also reported something like this with irc.
>
Yup, OE GIT is unreliable (or overloaded) the last week or so.

Who of the admins can have a look at this?

Regards,
-- 
Leon


