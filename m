Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TNtCP-0003jZ-J1
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Oct 2012 00:31:49 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so4616312pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2012 15:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=38x5FQHdqGdHYBDC/5WgtpKAR4L+XOHRxViTNSOfkLI=;
	b=GGrQ9IL01qeA7HqhAkYqwza0O1J35hiGAq7J7mZwDaMpmsz994eKjDovRymKggCst6
	XpMDqdrBWpRLCjJIrRx70UPx2TR1pL0SfVBg0804NlcIE4DkB/18GO97rgNlla/NMB71
	Jvqa2io4Y8w+Wlbmrqta+UzNUWb+GR16peNz62bCzPNLtDUo2EhZ/48xcDw6xrmKJ3sd
	HHQdV5ut+SvrGUTPMmbuFxbFKTrN/39ZFb6YCMNL0dp7otTxozumxLD2Z+a2kpz/4Wsc
	Xk8bHRjIncrP9KrZyT1CEgg/1D8hFVxbIA+a0x1vPnZJJ3yWGEtzAvQfGkX5AVD4j9zl
	3/Tg==
MIME-Version: 1.0
Received: by 10.66.87.133 with SMTP id ay5mr36522943pab.59.1350339512788; Mon,
	15 Oct 2012 15:18:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Mon, 15 Oct 2012 15:18:32 -0700 (PDT)
In-Reply-To: <1349991962-3844-1-git-send-email-otavio@ossystems.com.br>
References: <1349991962-3844-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 15 Oct 2012 19:18:32 -0300
X-Google-Sender-Auth: KUdYZ6yaFxyVO6iUSM1P-JL0DP0
Message-ID: <CAP9ODKqsTH89m9X24E3geG4Ox--dhCsG93gz7T70NhJtYpRciw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] xbmc: Fix serveral build errors and install missing dependencies
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
X-List-Received-Date: Mon, 15 Oct 2012 22:31:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 6:46 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This allow the package to build fine. On the test board it didn't show
> anything in display but it seems to be hardware specific issue.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

ping?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


