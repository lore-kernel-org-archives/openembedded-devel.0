Received: from mail-qe0-f47.google.com ([209.85.128.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1URquJ-000276-0P
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 23:25:47 +0200
Received: by mail-qe0-f47.google.com with SMTP id w7so2940506qeb.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 14:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:subject:references:date:in-reply-to
	:message-id:user-agent:mime-version:content-type;
	bh=P98AP90k4S5lNl+beOa8xIyzoNDZpeSy74Vsi3VKZcc=;
	b=minoWoqEuMan8I+iClHIKEoUuqchJFGiqZ92SAUQA7d7XTp/S1EpqeT62CZmLyc1t4
	Chzx/p2jDDWO96h9Cq/CvV1ELmlgHsuz3ewmXcSoNljdm+LA076wX9hvh7+TwdIZewns
	dTkbdfFR5tiGrJwycTO5ChchUni4Lj16wDM8FEtXvOWXb5m2IIj9hZQxD1Ob7+osBXUf
	AnVpCht57GQ4IBYJcWc8u1RGYf/dSCUe6zHzy2+q5/uAOtWrF90OwgKlPYSJUjuGogW0
	Ca2/VfjPY5n7dP3uAk+DixCX8T6joOvgDxY4unY8ZsRH2aDYnrABopqknJ/Rwr0YBL1N
	//YA==
X-Received: by 10.49.74.226 with SMTP id x2mr28016259qev.63.1366060097516;
	Mon, 15 Apr 2013 14:08:17 -0700 (PDT)
Received: from cl-t066-141cl.privatedns.com.gmail.com (wkit.com.br.
	[67.205.85.241])
	by mx.google.com with ESMTPS id 10sm34792386qax.13.2013.04.15.14.08.16
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 14:08:16 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
References: <1366059851-7972-1-git-send-email-mario@ossystems.com.br>
Date: Mon, 15 Apr 2013 17:07:50 -0400
In-Reply-To: <1366059851-7972-1-git-send-email-mario@ossystems.com.br> (Mario
	Domenech Goulart's message of "Mon, 15 Apr 2013 18:04:11 -0300")
Message-ID: <85zjwzo63d.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] goffice: update to version 0.10.1
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
X-List-Received-Date: Mon, 15 Apr 2013 21:25:47 -0000
Content-Type: text/plain

Hi,

Out of reflex I ended up setting the subject tag for the gnumeric and
goffice patches as [meta-oe].  They are actually in the meta-gnome
directory.

Do you want me to resend the patches to fix that?

I noticed the meta-gnome directory has no README with instructions for
submitting patches.

Best wishes.
Mario


