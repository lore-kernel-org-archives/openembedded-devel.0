Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SKuXk-0007fH-6W
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 18:49:16 +0200
Received: by lagw12 with SMTP id w12so6314583lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2012 09:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=m1X2KHURc3ED0yh2F+uMQGR0CD9G/TK+rXAoGWjBamk=;
	b=jYwebKuKqUx/3iwUYj5Z5s6UXPgPfgGsLzVZoB7M6EJk9FEdEXZnH5oiyXCpensE7I
	ROzpuMhTiqdNOBWFUoy+f+PwR95FKJSnB+2K/jJhU3lpN3ldGsXrYeBJxCII8/1CFnt5
	dI5vio6f2ZDa1fJh50OuDOz3aGCa5SwT44b5BdRDP8vAezRPB9qoTR7+DBOx8QiPGHx3
	ErcZ2HZi2O8w6g9INwXMq9EnUq88FOpmdN4zpLDKsR+wluXuZsD+SQ8aQVrNrQfO9C9R
	7HbJFlA5Up8SFOEcnJ31P0mXUY+t9CW1Zulyt2R38Ehe7odJ5E6+j0V96yUJCnQapbyf
	jQkA==
Received: by 10.152.146.234 with SMTP id tf10mr2613230lab.31.1334853587298;
	Thu, 19 Apr 2012 09:39:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 19 Apr 2012 09:39:17 -0700 (PDT)
In-Reply-To: <CAOHjBZtTxc7L8OpwMsSFr_xqc6WVXRRWK7eV95BDxnOLrjMqyQ@mail.gmail.com>
References: <CAOHjBZtTxc7L8OpwMsSFr_xqc6WVXRRWK7eV95BDxnOLrjMqyQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Apr 2012 09:39:17 -0700
Message-ID: <CAMKF1sqi4v85hPqEqtWs1P367ySWd1vbARC8HtdZyt6NRiuzGQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-core] gcc-runtime failure
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
X-List-Received-Date: Thu, 19 Apr 2012 16:49:16 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 19, 2012 at 3:54 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
>
> Please clarify this to me... :)

gcc-runtime does not need target libgmp or libmpfr or libmpc
infact its just the cross compiler which needs it.


