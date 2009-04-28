Received: from [74.125.46.155] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Lyrjw-0004f7-27
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 20:09:15 +0200
Received: by yw-out-1718.google.com with SMTP id 9so434711ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 11:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XMmBpdyR9fEz4juQoDswS9ESx9YwbemBi+KJGrrE0Q0=;
	b=h0Jk42xQ55r+0nY83RrAZq0mN5lNlyqKlFpvWiwNh68KvvPrcYK5XI3KI+V7fw70Au
	eidbw5Qaoh6gtDY10i8OStt0H/OahUIDGLCQeor4AeRBBC7BAUtqzRMbTBqcoHaTuR5F
	hLkll26zAWEzhv+VwexTNhTMYLfgwNzwGvG5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Jh+0ji83EZM9VJN5SdvS6+8pSqYFaMm68A1wSuyxcDwENT0SlAodtsvfBaTcwZjr8h
	9JkzO19B+7d9m7YRIkNwLxVtnFhrsS14TgiWSyf1fOMe5GIECYfh9QaaCGRs6He2KDLN
	ojFpM8qZzJVomZGV/s3NibSa9HWPGm5Vuu0cU=
MIME-Version: 1.0
Received: by 10.100.41.9 with SMTP id o9mr10499032ano.155.1240941837410; Tue, 
	28 Apr 2009 11:03:57 -0700 (PDT)
In-Reply-To: <20090428040959.GT18788@smtp.west.cox.net>
References: <20090428040959.GT18788@smtp.west.cox.net>
Date: Tue, 28 Apr 2009 20:03:57 +0200
Message-ID: <c384c5ea0904281103i4834de81l1f8ff336255eb14b@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Enable PTHREADS_DEBUG_SUPPORT on all uClibc builds
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
X-List-Received-Date: Tue, 28 Apr 2009 18:09:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Tue, Apr 28, 2009 at 6:09 AM, Tom Rini <trini@embeddedalley.com> wrote:
> As has been reported, building uClibc with PTHREADS_DEBUG_SUPPORT=n

Acked-by: Leon Woestenberg <leon@sidebranch.com>


