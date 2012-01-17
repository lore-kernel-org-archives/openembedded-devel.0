Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Rn4Op-0006IB-RU
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jan 2012 09:28:12 +0100
Received: by iabz21 with SMTP id z21so2719782iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2012 00:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:from:in-reply-to:mime-version:date:message-id:subject:to
	:content-type; bh=5qu5tGTUboR7t6o8/j7r+JzeI5F5gZwe5z5v7XjFNOk=;
	b=oM13k0OFxwjwJhjp7LSC27VwUGI6k8GLdrdSgwFJTsC5M34hNbStrOLOTZQb45fLzG
	k1eiJDMQiYDDY/iBhqFqlQ7obMVWS2kcOy4NMAEJz8arMrf2buNFFgdspjXtT3frwQMl
	xyzzqD450RXvP62YJyDAjVCtUYQgouIJxOeOY=
Received: by 10.42.147.72 with SMTP id m8mr13238932icv.56.1326788434410; Tue,
	17 Jan 2012 00:20:34 -0800 (PST)
References: <4f13d827.8b7a0e0a.2808.ffffe10eSMTPIN_ADDED@mx.google.com>
	<873008982550291386@unknownmsgid>
	<CA+M6bX=AwJFueoj1mGOkP2b7pFm14SSpOEMcbU1Ly4B_5v6LLg@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
In-Reply-To: <CA+M6bX=AwJFueoj1mGOkP2b7pFm14SSpOEMcbU1Ly4B_5v6LLg@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 17 Jan 2012 09:20:34 +0100
Message-ID: <8772233880060257226@unknownmsgid>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Python2.7.2 compatibility
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
X-List-Received-Date: Tue, 17 Jan 2012 08:28:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Tom for the clarification.

Il giorno 16/gen/2012, alle ore 20:28, Tom Rini <tom.rini@gmail.com> ha scritto:

> On Mon, Jan 16, 2012 at 1:00 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
>> Hi All, I've read the OE-Classic repository will be stopped and alla the
>> new work will be on OE-Core one. Can you confirm this? If so, I'll have to
>> move my work on a given layer in this new developing tree. Please let me
>> know.
>
> While the exact timetable isn't set in stone, yes, this is the long
> stated plan.  For work that's already in-flight, as it were, there'll
> be the 2011.03-maintenance branch for as long as there's interest but
> the oe-core model is where the project is heading for the future.
>
> --
> Tom
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


