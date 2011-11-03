Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mgargela@gmail.com>) id 1RM5YX-0002rs-Up
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 23:14:42 +0100
Received: by gyh4 with SMTP id 4so529090gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 15:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=w943F+rgfM6iL0WgrT8SGSqv7RrXwMudNcKzapiVS88=;
	b=BrGqCpCollxg8iX8kd54Tj2UPXJO3e/Rxh4Q0itfIKHv8N5ylRhF1CMXZj2Br4sfhu
	Iz96KAxMOn5pzXr+XRTzBKK3W+iOVPjTkXs5cKqgHV6BsfEAJxUpJoQm5eryqRWTt36I
	W/94U6Gcuzm5mI9LwbUKEzhR8Sfc9c2EjJ8SI=
MIME-Version: 1.0
Received: by 10.236.161.133 with SMTP id w5mr15637370yhk.63.1320358106917;
	Thu, 03 Nov 2011 15:08:26 -0700 (PDT)
Sender: mgargela@gmail.com
Received: by 10.236.110.7 with HTTP; Thu, 3 Nov 2011 15:08:26 -0700 (PDT)
In-Reply-To: <CABcZAN=9hRzsRE0=qPuCn+Kf5z-fNYQmtsh702OWnHyJ9uQbHg@mail.gmail.com>
References: <CAObi9r-62Wr8S8aJV0=UvpB9mhP657UBw556w-cpSq9YkCZ7TA@mail.gmail.com>
	<CABcZAN=9hRzsRE0=qPuCn+Kf5z-fNYQmtsh702OWnHyJ9uQbHg@mail.gmail.com>
Date: Fri, 4 Nov 2011 00:08:26 +0200
X-Google-Sender-Auth: MjtWN3KpJ9p2PqzPPHFDnHv80_M
Message-ID: <CAObi9r_sRN_OMHmTDgJZLkEwX_XwE5F5feXcBO+XeNf_fT7MKA@mail.gmail.com>
From: mgundes <mgcse@hotmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: running bb located path info
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
X-List-Received-Date: Thu, 03 Nov 2011 22:14:42 -0000
Content-Type: text/plain; charset=UTF-8

   Thanks Chris.

Regards,

On Thu, Nov 3, 2011 at 11:21 PM, Chris Larson <clarson@kergoth.com> wrote:

> On Thu, Nov 3, 2011 at 2:06 PM, mgundes <mgcse@hotmail.com> wrote:
> >   I need to know is there a variable assigned with running current bb
> file
> > path?
> >
> >   One of freenode #oe friend told me to try THISDIR but It did not work
> > for me. By the way, I use openembedded classic.
>
> The 'FILE' variable holds the current file's full path. FILE_DIRNAME
> is the directory it's in.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
MahmutG

