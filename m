Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tdd3N-0002Ae-2e
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 09:31:33 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so9283356iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 00:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Un5CPccIS9jR+gZMPF1WCQceLBYY5wS8mU2+tSC+C9o=;
	b=k05WY88CNGF4YM/alFEC+nQD0fdrExTGlc94RKajM4hzNdOf55w6RjsyfarpmkdSUL
	ozirws2T9TbOgQ5LUjGPHCVxR7TnIAZ3W6jfbhPC7TBgfc78bXxSImsx8ER92Lmnj2J/
	Pm26Ci2JTAbUIFmHYl6WdwqXqvGNEGBO3N9WblLm1E4zFPdIWllGbBt9WLGaaRmsZQll
	BTyol7SU1RJecdkDu53KVLhMQk5DUMn8G7fpuEFUasv4pFEtV+QURR2IYJDCEUsq351c
	Vld5osCpyHQMupjli4TKIjBvJB5m3JFS0peiNgyF6gSA6WRPr4u7kShjhA1J6MH7WyGa
	svdg==
MIME-Version: 1.0
Received: by 10.50.104.232 with SMTP id gh8mr21239587igb.45.1354090638453;
	Wed, 28 Nov 2012 00:17:18 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Wed, 28 Nov 2012 00:17:18 -0800 (PST)
In-Reply-To: <1353503805-5711-1-git-send-email-schnitzeltony@googlemail.com>
References: <1353503805-5711-1-git-send-email-schnitzeltony@googlemail.com>
Date: Wed, 28 Nov 2012 09:17:18 +0100
Message-ID: <CALbNGRSosM5Rh96RTQWAv0L4p-_XF6EkErzMUzdHNOAA++OU=Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-systemd] lxdm: bugfixes by updating to latest git
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
X-List-Received-Date: Wed, 28 Nov 2012 08:31:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2012 at 2:16 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> * make keyboard layout combobox display languages properly
> * systemd-support is included mainline
> * autologin for timeouts < 5s works as expected
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |   10 ++++++++--
>  .../recipes-graphics/lxdm/lxdm/lxdm.service.in     |   10 ----------
>  .../recipes-graphics/lxdm/lxdm_git.bbappend        |   10 +---------
>  3 files changed, 9 insertions(+), 21 deletions(-)
>  delete mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.=
service.in
>
ping


