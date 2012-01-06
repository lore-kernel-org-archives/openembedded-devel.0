Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjIHF-0007Fi-32
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 23:28:45 +0100
Received: by eaal1 with SMTP id l1so1315209eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 14:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=GHYqx2bBik4n/EDuKhaSyb9DEPk8+ZTXrTP6ZqU+TAk=;
	b=nfmEWazGy9cKc/5QO4jX1pguvPu0Zc3oJRcpGB8raqAByRzyYw7mGqgYuce8+1nyxC
	u0qtfMRsZYGEV9RnATXblTuZztYfrsU8eQo/e++RHFEQyedB6K6r6NIlIi9hPloV5+H9
	lYeArihOjDQFr84bmblgrYS2nm/Sr1iA0D9PI=
MIME-Version: 1.0
Received: by 10.205.136.205 with SMTP id il13mr3320856bkc.37.1325888479283;
	Fri, 06 Jan 2012 14:21:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.8.139 with HTTP; Fri, 6 Jan 2012 14:21:19 -0800 (PST)
In-Reply-To: <CAP9ODKrhfnL_+VJNWFQ0J7uyw3yayZ-e+gnyzsp4gjivxdtL2Q@mail.gmail.com>
References: <cover.1325876341.git.otavio@ossystems.com.br>
	<b61f46cb503582b669cbc56b0ea04d7fdaafd256.1325876341.git.otavio@ossystems.com.br>
	<1325879877.3234.2.camel@lenovo.internal.reciva.com>
	<CAP9ODKqpDS=sJQ-uuP5+E6QOMU7eQheWXqk+TSA4fkpwha6LVw@mail.gmail.com>
	<4F0763FD.9000801@windriver.com>
	<CAP9ODKrhfnL_+VJNWFQ0J7uyw3yayZ-e+gnyzsp4gjivxdtL2Q@mail.gmail.com>
Date: Fri, 6 Jan 2012 20:21:19 -0200
X-Google-Sender-Auth: l_iiC-oQXzXKc0U6KcVX_bdnibE
Message-ID: <CAP9ODKo+uNuXx+jmN6uiFgG9nuwEuTjwc2JDpXnrygyp88j=rQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 5/5] udisks: disable manpage building
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
X-List-Received-Date: Fri, 06 Jan 2012 22:28:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 6, 2012 at 19:49, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Fri, Jan 6, 2012 at 19:13, Mark Hatle <mark.hatle@windriver.com> wrote:
>
>> In what way?  Most of the problems I've observed in the past have been
>> docbook related, but I think those have been resolved within OE-Core.
>>
>
> Docbook related problems; you prefer if we fix those then?
>

It uses xsltproc and there's no native recipe at this moment.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

