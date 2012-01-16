Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RmsBo-0006as-30
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 20:25:57 +0100
Received: by qcsp14 with SMTP id p14so1529288qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2012 11:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=mEQ9svr5S0ATL30f50pPQ30kGe+9E6I2t3HymQmrdX0=;
	b=BU1QFfNwozElyK4zHZ9idbgCaycgrodBm/SRrZ/MAmPJrB73X65t8ca4g7VgOlex3d
	2GKlf22eQS3AJAny+qyl6mskwRDjmc2so4A3fx99/wfdWQYFbinwOtGMBNasLoka7rmF
	8DyD0V6nBQjYP7Ui1Tg1tKFSA0hqg1FhQ61os=
MIME-Version: 1.0
Received: by 10.229.106.35 with SMTP id v35mr4956823qco.84.1326741499537; Mon,
	16 Jan 2012 11:18:19 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Mon, 16 Jan 2012 11:18:19 -0800 (PST)
In-Reply-To: <873008982550291386@unknownmsgid>
References: <4f13d827.8b7a0e0a.2808.ffffe10eSMTPIN_ADDED@mx.google.com>
	<873008982550291386@unknownmsgid>
Date: Mon, 16 Jan 2012 12:18:19 -0700
Message-ID: <CA+M6bX=AwJFueoj1mGOkP2b7pFm14SSpOEMcbU1Ly4B_5v6LLg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 16 Jan 2012 19:25:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 16, 2012 at 1:00 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Hi All, I've read the OE-Classic repository will be stopped and alla the
> new work will be on OE-Core one. Can you confirm this? If so, I'll have to
> move my work on a given layer in this new developing tree. Please let me
> know.

While the exact timetable isn't set in stone, yes, this is the long
stated plan.  For work that's already in-flight, as it were, there'll
be the 2011.03-maintenance branch for as long as there's interest but
the oe-core model is where the project is heading for the future.

-- 
Tom


