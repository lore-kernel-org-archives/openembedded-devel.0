Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TukbQ-0007b3-UU
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 15:01:30 +0100
Received: by mail-vc0-f182.google.com with SMTP id fy27so3542664vcb.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 05:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NvbW8guunGAezk2HYY4DkPqXBPrERQolNjnw3ZM9kVA=;
	b=Oibjka6nU11ygwJhJUP/vlWdiri8KK9h/PWCQqav3/lFFppJxRXrZm8cWfL+BHT+Ym
	mI3xWQWEvLkfFEjlOZ5PTJkXKpJ7/uL3cm5LRUGuFqUoHyALPFP9SRiiDSrej13QpK+F
	C588eoy63OjBkY+YWWifivdf5aONX/ejGVDgWObBIbevkbNfScvthgiSC8/5Kl9MOXPP
	EO+q6zZKkySz53rtNuHQUyknIAoJqbhX9bSyhrwGgHRKv81DZJ41P17jNrIC3fUOd2WH
	bMhjjueNWpf7t1oa/llJ1BocN21Kk26FabipWS1KsOV1zXJbFjG/TMW7pa+WV6LOGN2J
	g6ow==
MIME-Version: 1.0
Received: by 10.52.21.107 with SMTP id u11mr88406399vde.101.1358171169655;
	Mon, 14 Jan 2013 05:46:09 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Mon, 14 Jan 2013 05:46:09 -0800 (PST)
In-Reply-To: <CAJTo0LZVhAeEKW8vUA4=r1poz80p+w9jTOCDOJHK8tfn52PyXw@mail.gmail.com>
References: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
	<2159085.vty0yDIBH9@helios>
	<CAJTo0LZVhAeEKW8vUA4=r1poz80p+w9jTOCDOJHK8tfn52PyXw@mail.gmail.com>
Date: Mon, 14 Jan 2013 14:46:09 +0100
Message-ID: <CALbNGRRg4yMLrfVeHgAcs_f85QdtzphOVCP6BeBoeRyg8SSjiQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-multimedia 0/2] games preparations
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
X-List-Received-Date: Mon, 14 Jan 2013 14:01:30 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 14, 2013 at 2:38 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 14 January 2013 13:34, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> There is a meta-games FYI, I think this is possibly where these recipes ought
>> to have gone.
>
> Agreed, these are gaming-specific and not generically "multimedia".
>
> Ross
The idea was to give these libraries a wider audience for
review/testing than meta-games has.

Andreas


