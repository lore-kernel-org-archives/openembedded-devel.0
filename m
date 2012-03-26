Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1SC7M1-0008Nt-NN
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Mar 2012 12:40:50 +0200
Received: by wera1 with SMTP id a1so4059352wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2012 03:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=W30W4dFcaH46vI/0qtVUJ7++dPFyJsd4FFZlSu7RrMU=;
	b=u7ez5lj1qMfreSqRd+WnNCcZb7/R8qQ3w2O/qNMuoy5tmzXLZHcLbweTHJE0pO6f0k
	5+zwppNsC24LiGeh/LP3pHgEiO2PIt6SJwpwyrpTdgG6TlqeibkxqyvF3M/OTncjKfMY
	jh38KBG+Mta1/VIsZ1lBAIoKXF+T9TbdPyzAwuNJvLizcCJvFKeYpfXpZdDTdaFYvg/S
	cqvPWDMAl4dtX+owXmkD7ltQTU4Mnxwx08Pdjm/+r77H4hyd2qJ8btzd2FHG9nmF5uGX
	DOs0hwD6fRLI7fUwSUUXi5eraAWjC/TqHF/VcRHoFb42GN5qrZ5XFvmQDZLFR1AJ+N4M
	lmmQ==
MIME-Version: 1.0
Received: by 10.216.137.149 with SMTP id y21mr12357236wei.110.1332757910137;
	Mon, 26 Mar 2012 03:31:50 -0700 (PDT)
Received: by 10.216.29.196 with HTTP; Mon, 26 Mar 2012 03:31:50 -0700 (PDT)
In-Reply-To: <4F703D96.6020102@nedap.com>
References: <4F6B28B0.6010801@nedap.com>
	<4F703D96.6020102@nedap.com>
Date: Mon, 26 Mar 2012 14:31:50 +0400
Message-ID: <CAFZPMoYNvc4XFdSy9_xH-CYb8R1MOR8-7XsWU0medQFBnWTs8g@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: foreign repository
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
X-List-Received-Date: Mon, 26 Mar 2012 10:40:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 26, 2012 at 1:57 PM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> Anyone?
> Any idea?
You can read OE wiki regarding overlays/layers.
Also, you can use Koen's Angstrom scripts for no-brains configuration process.
Also, bitbake manual and OE existing layers are your friends.

S.


