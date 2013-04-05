Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UO3GF-0003C0-S9
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 11:48:46 +0200
Received: by mail-vc0-f181.google.com with SMTP id hv10so3084692vcb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 02:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=0kIMXUYNfi7uHAiguc1D5MWXQ0S8N/D9KXCzZiUfdoE=;
	b=LpJKeD6sLQeeEg+yUlQSSFKJWNCSE2h4WdUGwJi10auVnJUjB4Rkq6jSWfC1KjdVK1
	tuTc4aUGyyk9c8RMrhLT67CPy1g72PT2SGKjsP+o4krTF3LVyO/WI1DLma0ZLq+Jv2Lw
	Ns1PeNSlH3CRkGvzG7S71DjAwVt6Jq33HbW5KhM4SOYQSNbZaSD/edxuSMUimFfxsrMA
	cjsVYS5ncPm+BJdc9aesgjqKSXbyCXM9rXZ5/Z6qBUx3UirOomba5EFx/2rqCD1W1AKy
	3yThWYLiHiB3g6ZMG67RXZyZ7j+/Bd5OlPWTtgGipPK+QdkQivWcGZd49M/om6HYo7XT
	+DPg==
MIME-Version: 1.0
X-Received: by 10.52.65.147 with SMTP id x19mr6470495vds.27.1365154289569;
	Fri, 05 Apr 2013 02:31:29 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Fri, 5 Apr 2013 02:31:29 -0700 (PDT)
In-Reply-To: <1365150719-1428-1-git-send-email-koen@dominion.thruhere.net>
References: <1365150719-1428-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 5 Apr 2013 11:31:29 +0200
Message-ID: <CALbNGRSuRPYRnwxQJjBrLo6AHijC5cfaQhcLz+Q0dA2Jv-JMdg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: Re: [meta-browser][PATCH] chromium 24.0.1312.52: add launch helper and .desktop file
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
X-List-Received-Date: Fri, 05 Apr 2013 09:48:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 5, 2013 at 10:31 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> The .desktop file is from the Fedora chrome RPM, the script is a custom one.
>
> The launch helper has a nasty work around for root users, I'm open for better ways to work around that.
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Cool I was about to prepare something similar - thanks.

Andreas


