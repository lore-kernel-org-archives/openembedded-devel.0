Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PS5d1-00028G-QH
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 11:27:37 +0100
Received: by wwi17 with SMTP id 17so5718265wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 02:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HICfKPGdAWStujEQ8G1sHNx6Dv4M7YfRsKhNq/iJvIE=;
	b=IxRSsnAMWGffSKsVAygUwWWM/Rf2A+sQDuRdi22JeqRFc5PL/JL/p4IVqUVush2KFJ
	McD8jXLvUHkRxd/tBfoT3xM93uiSkAyPI2cMb6e8uYg4mel7+nxEYAQkVZ7gv6QB+lfr
	x9QNtoDVWttmJxNSbQb6vyQnTT3UbsZsopdmg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=czWcrbjhMCrQjYHZQnY5N9RMfZvAOswIJRyZifOXsrbBq8FM11Fe36yXhecluXEngl
	mnOYLgj25+R96yAkiGq9HdNVYq6wib8hZ0totYJRT7JYx7PLlEkG/DUZrcBZFXG9YHbu
	ABMGhFRXrCHIPvFrBi5arrEih+ju5PTETALiw=
MIME-Version: 1.0
Received: by 10.227.156.9 with SMTP id u9mr1498589wbw.142.1292235958914; Mon,
	13 Dec 2010 02:25:58 -0800 (PST)
Received: by 10.227.20.15 with HTTP; Mon, 13 Dec 2010 02:25:58 -0800 (PST)
In-Reply-To: <1291914227-25068-7-git-send-email-obi@opendreambox.org>
References: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
	<1291914227-25068-7-git-send-email-obi@opendreambox.org>
Date: Mon, 13 Dec 2010 11:25:58 +0100
Message-ID: <AANLkTi=kxbh7fbHAFCzL+LazCvFmqFoOeHuxyvcjpqJO@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 7/8] gst-plugins-ugly: remove unpinned versions
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
X-List-Received-Date: Mon, 13 Dec 2010 10:27:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2010 at 6:03 PM, Andreas Oberritter <obi@opendreambox.org> w=
rote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0.../gst-plugins-ugly-sid/gstsid_autofoo_HACK.patch | =A0107 ----------=
----------
> =A0recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb =A0 | =A0 21 ----
> =A0recipes/gstreamer/gst-plugins-ugly_0.10.10.bb =A0 =A0 =A0| =A0 21 ----
> =A0recipes/gstreamer/gst-plugins-ugly_0.10.11.bb =A0 =A0 =A0| =A0 21 ----
> =A0recipes/gstreamer/gst-plugins-ugly_0.10.14.bb =A0 =A0 =A0| =A0 21 ----
> =A0recipes/gstreamer/gst-plugins-ugly_0.10.15.bb =A0 =A0 =A0| =A0 20 ----

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


