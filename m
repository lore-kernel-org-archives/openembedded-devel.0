Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <seba.dos1@gmail.com>) id 1R49ai-0001hN-Cu
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 12:54:48 +0200
Received: by qyk4 with SMTP id 4so3151695qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2011 03:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=SEQrtN7p97/8XTe2wiLLBOsjOUWZoSD88SURuobOQMU=;
	b=wwsnzchC6OQN+HOsj1LfIHu4A86rZGeTChf5YX8Cpt0YgR037hsHOo5os29azOq5Hi
	oHG1RguFFgrbp7TfbQVaNp+Vx/xn3lu4XWm/0leieqlOL/KJGHD0OPerH0ueE3zv6G4n
	tKSf8lwSDVODCjzUeFpeAdvg3nd2okaIQVXZs=
Received: by 10.229.62.103 with SMTP id w39mr746378qch.292.1316083776162; Thu,
	15 Sep 2011 03:49:36 -0700 (PDT)
MIME-Version: 1.0
Sender: seba.dos1@gmail.com
Received: by 10.229.232.207 with HTTP; Thu, 15 Sep 2011 03:49:16 -0700 (PDT)
In-Reply-To: <1316082725.4523.67.camel@mattotaupa>
References: <1316082725.4523.67.camel@mattotaupa>
From: Sebastian Krzyszkowiak <dos@dosowisko.net>
Date: Thu, 15 Sep 2011 12:49:16 +0200
X-Google-Sender-Auth: gxXWTJ6r_cYS5yXxHDT-kSFFYss
Message-ID: <CAMkzfpYgJET8PDZ80NB6ARX5OQJSe+T6kZCRdM5cDdxDm8FxBg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Do we need a patch queue (Patchwork)?
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
X-List-Received-Date: Thu, 15 Sep 2011 10:54:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 15, 2011 at 12:32, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> 1. It is a lot of work to update the patch state manually.
> 2. A lot of people refuse to use it.

What about modyfiing patchwork so patches could be marked as accepted via email?
For instance, when dev is sending message "Applied and pushed,
thanks!" he could also insert some tag "#patchwork:done" or something
like that at the beginning so it would be automatically marked as
done.

Something like that (but much more complex) is working on Debian
maillists regarding bugtracker.

-- 
Sebastian Krzyszkowiak
dos


