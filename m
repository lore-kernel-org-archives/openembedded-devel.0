Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TfYlj-0007N9-0g
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 17:21:19 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so2255848iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 08:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:in-reply-to:references:user-agent:date
	:message-id:mime-version:content-type;
	bh=LDiat3t304oyUbkwqhmgdVmM0XhKMs4lYhBUuecT87c=;
	b=T3CPJ4q06dOq7iXc3OyWQaSjlIW6WDCPoW7KGuYXbaYbtGBUNX8VWftSEhHBdV8rwf
	Iu8S1CAc8/0EmgZbBJlnzonVprBKmiMePqi+tvdbR82v8Lm1J4gZbJyIcP/97B/hqMs7
	Ov6kySjktzA97iD+asjM7DfO5sa5K6GFGC1OY4lD08bYNyUQFwTD8juE26nROQb/kLdy
	FdTdBRzcoJGAwIMzbYmAiODhZfsRmWfVI4PFBTGsGCpmQvaP8vqlAKvpiUrZxvK1Pbn7
	wc4yUmjtvGg2I71EyPLJ2n0CYzJBNh5Y//DWY2VpYlvuqHOWWgr+ko7DnYXpN2A6a+HP
	4nyg==
Received: by 10.42.51.207 with SMTP id f15mr8169789icg.16.1354550817183;
	Mon, 03 Dec 2012 08:06:57 -0800 (PST)
Received: from cl-t066-141cl.privatedns.com.gmail.com (wkit.com.br.
	[67.205.85.241])
	by mx.google.com with ESMTPS id v12sm7983130igv.3.2012.12.03.08.06.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 08:06:56 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <k9a6et$3en$1@ger.gmane.org> (Koen Kooi's message of "Fri, 30 Nov
	2012 12:48:50 +0100")
References: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
	<k9a6et$3en$1@ger.gmane.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
Date: Mon, 03 Dec 2012 10:54:03 -0500
Message-ID: <854nk3dtd0.fsf@cl-t066-141cl.privatedns.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/6] freerdp: disable man pages generation
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
X-List-Received-Date: Mon, 03 Dec 2012 16:21:19 -0000
Content-Type: text/plain

Hi Koen,

On Fri, 30 Nov 2012 12:48:50 +0100 Koen Kooi <koen@dominion.thruhere.net> wrote:

> I had trouble applying these from patchwork, can you provide a
> (rebased) git branch where I can pull there from?

Sorry for that.  I just sent rebased patches (tagged as PATCHv2).

Best wishes.
Mario
-- 
http://parenteses.org/mario


