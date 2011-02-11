Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Po1Pi-0004IM-NK
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 23:24:31 +0100
Received: by wyb40 with SMTP id 40so2885086wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=fabh7Gb3M10ZcmGd3viaUXuNCJN51o4YwAncw2Xs9FQ=;
	b=whhqgawse8TYFz7kTs4qGTBn52z0x66Yxvp2FVSiBOxUFQactlX1IJqoqaM6gAmKbS
	8a1ccc1ldRFbWGivLqddLzscFqo0vrVGVlJNXg1YW+QkAOffD3lR3LjAQ9k35HP1zeVd
	a8kMGbYe+1iEwF9ACtlQA/TT2JmfRbT0NwvhY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=KahwowNgfqvlh2HwD0Fg11YGLBbbqNrNzQiTcXwLrCEcYcm0XlWFcV79GbUXhiTlkh
	RLVZ7umnDs/DVCCewcNCxFt1Bie32WoCBwJElaH0Oy7O/hHvd0QTIBeejIFrY6uuibvO
	YQgWOKufvU7YT3nQiQLcw4ONsCWcQ/1EQx990=
Received: by 10.216.3.144 with SMTP id 16mr1217180weh.45.1297463003618; Fri,
	11 Feb 2011 14:23:23 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.17.11 with HTTP; Fri, 11 Feb 2011 14:23:03 -0800 (PST)
In-Reply-To: <1297428703-2330-2-git-send-email-obi@opendreambox.org>
References: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
	<1297428703-2330-2-git-send-email-obi@opendreambox.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 11 Feb 2011 15:23:03 -0700
X-Google-Sender-Auth: AE7QtGqIZ8wmI1pghJPQTidy8vQ
Message-ID: <AANLkTikFfJGM_cZjLECetSi5s7CUWNXfbigj5gbYcTn+@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/4] package.bbclass: remove superfluous whitespace characters from RDEPENDS
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
X-List-Received-Date: Fri, 11 Feb 2011 22:24:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 11, 2011 at 5:51 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Acked-by: Chris Larson <chris_larson@mentor.com>


-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


