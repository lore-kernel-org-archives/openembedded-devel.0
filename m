Received: from mail-ia0-f170.google.com ([209.85.210.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TsdIB-0006fr-G6
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2013 18:48:57 +0100
Received: by mail-ia0-f170.google.com with SMTP id i1so596694iaa.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 09:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=D/ZduQAeqA2y2Ix7653snjk3b8Ie+wBv95nBXoSN0rI=;
	b=AlYG48ZKkkS3erUpdI9bh7xMiRdH+JeaB4cPa/lt4IjefY8IGjHx1BuR4h3+0dkbS0
	dpWwqWgJx71EUIzwpq5VQ09CzUU8gC82+ToHMbqJNdi9SYZ863cRebc5qmg640N77utV
	gGWs1Y4giN7H/7P7C2aLnDcUhJekloERFjVocmOMdiwj4zGyhXLsW7LpU+dbf048xuWi
	N3bdnT8E5tVlZs246c7LPnaig7HriPtFDlGAOQQB5UFZC7rPU1GhY7O/8ZJKrwX0Umrn
	F9CSwn7WpkdkNk0kooQ/YcYSLdzug1GEX/YJVbaGOB6lRQNc0fpi9EjpGLyBZtMH2oyq
	nc3Q==
X-Received: by 10.50.13.173 with SMTP id i13mr9677143igc.93.1357666419851;
	Tue, 08 Jan 2013 09:33:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Tue, 8 Jan 2013 09:33:09 -0800 (PST)
In-Reply-To: <CAMKF1spPeb-_h7GyDSY6W7cTnn50ZUP1DvmtgQni5O4nXE3_pw@mail.gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-13-git-send-email-raj.khem@gmail.com>
	<20130107181558.GF3285@jama>
	<CAMKF1spPeb-_h7GyDSY6W7cTnn50ZUP1DvmtgQni5O4nXE3_pw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jan 2013 09:33:09 -0800
Message-ID: <CAMKF1speTgLzAh_GtOEmvf9YWqze=gbZ5B8Ok-yktQHkPmKK7Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2 13/25] concurrencykit: Add recipe for latest from git
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
X-List-Received-Date: Tue, 08 Jan 2013 17:48:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 7, 2013 at 1:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jan 7, 2013 at 10:15 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> | Detecting operating system.......success [linux]
>> | failed  [unsupported]
>
> it indeed is unsupported for anything other than ppc,ppc64,i386,x86_64
> as far as OE is concerned atm
> I will add proper supported host regexp for this in V3 and push it to the tree

I have now pushed a V3 with proper compatible host regexp into the pull branch


