Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MSewY-0002md-Nn
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jul 2009 00:33:18 +0200
Received: by gxk27 with SMTP id 27so2879443gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 15:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=CwjFfv84HvZMFZ2d5TG4QVKg4opkBJPCPaksGOxWcU4=;
	b=A+MomZsrCp4Gl9Fu6El1hdZKr9XGgJZ/Gkc7fmFIMAV+ywhGcw4pjs0tEXaA7MpRSB
	BQBsTGBvgdazc7a4GN4/R7RbzS4tfrxh4RD57q6kU1A3KyfZhNYSdZBTPZj9PLvTv/NR
	/CGviCwKJHhZ4KOo5MdpSgjuy2qAdPFsMLIjs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ELknc4z7k3hCzn/n3Du5q/6fdlmNGmK+yNwCs8FdQymiv/sPcZzpHOPJhgrA3JmMim
	KhMh4nT4ajqBCeNtNnbmkLfjjEC+TH3tUiIMWBVPEhLBhR2hqzPTcCmJCy7pswBDDpxQ
	8+qLOHiokDAevJOMEl/KwT5KbmiNpCYFwXB7A=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.138.7 with SMTP id l7mr5318879and.141.1248041964498; Sun, 
	19 Jul 2009 15:19:24 -0700 (PDT)
In-Reply-To: <4A6374DB.8020901@balister.org>
References: <4A6374DB.8020901@balister.org>
Date: Sun, 19 Jul 2009 19:19:24 -0300
X-Google-Sender-Auth: d9d41f0daed1eeb5
Message-ID: <be7a9f3d0907191519w1d7c6179u178e27c10cc09697@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: sqlite3 recipe
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
X-List-Received-Date: Sun, 19 Jul 2009 22:33:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Sun, Jul 19, 2009 at 4:32 PM, Philip Balister<philip@balister.org> wrote:
> Does anyone mind if I push this change? I ran across a package that needed
> an additional header not staged by the current inc file.

It looks like you've forgotten the PR bump. In this case would be nice
to move it to INC_PR stuff.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


