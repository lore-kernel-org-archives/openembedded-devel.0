Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1896FF86
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 17:52:19 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id ph11so43610917igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 09:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qDMW0HK866+8EyJk6JcFuEV52DdPOhQdBIBEcd/v0Qs=;
	b=BKQa3GYAmgSO1eihzCJKMWI9YPgLguewmJIGFrMqwkxKO87R+r63XALy0r9H6dfC3u
	lIOK4FQ8ptBoLGukMulTEYzk8+1ZFs9k6LOnj4nH3myrOZKsJ0yD8iWILQtXjgfnYiof
	kXucxsLQ4INumEH3Srp1LaPATqGWDsMFd++ih1BmuslJRYLp4Da30sl+Q9iyIMyP9nBU
	MqGeEjm+cFGps7lv0JFzN/SZxBCTN+QFuIKVCTTxCzcFaSr5G03IoWNSI8/cT3z/hUHw
	chJmJsehmSXUckfjl2N5Gk3S+4CrZYwqMU2pUoSh1PAxHc1NWUjPfFiweMgNRklAM7cA
	wMFw==
X-Received: by 10.50.20.138 with SMTP id n10mr6063380ige.11.1449856339750;
	Fri, 11 Dec 2015 09:52:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Fri, 11 Dec 2015 09:51:50 -0800 (PST)
In-Reply-To: <1449853045-7196-2-git-send-email-fabio.berton@ossystems.com.br>
References: <1449853045-7196-1-git-send-email-fabio.berton@ossystems.com.br>
	<1449853045-7196-2-git-send-email-fabio.berton@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Dec 2015 09:51:50 -0800
Message-ID: <CAMKF1sqocKAiPhPrn1BVECXek-P_soqvr3BkkN8SA4sLwaHQVw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-browser][PATCH 2/2] firefox-l10n-*: Update to version 38.4.0esr
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Dec 2015 17:52:20 -0000
Content-Type: text/plain; charset=UTF-8

looks ok

On Fri, Dec 11, 2015 at 8:57 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  ...firefox-l10n-ach_38.2.1esr.bb => firefox-l10n-ach_38.4.0esr.bb} | 4 ++--
>  .../{firefox-l10n-af_38.2.1esr.bb => firefox-l10n-af_38.4.0esr.bb} | 4 ++--
>  .../{firefox-l10n-an_38.2.1esr.bb => firefox-l10n-an_38.4.0esr.bb} | 4 ++--
>  .../{firefox-l10n-ar_38.2.1esr.bb => firefox-l10n-ar_38.4.0esr.bb} | 4 ++--
>  recipes-mozilla/firefox-l10n/firefox-l10n-as_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-as_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.2.1esr.bb         | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.4.0esr.bb         | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-az_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-az_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-be_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-be_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-br_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-br_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-da_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-da_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-de_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-de_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.2.1esr.bb         | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.4.0esr.bb         | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-el_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-el_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-et_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-et_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-he_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-he_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.2.1esr.bb         | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.4.0esr.bb         | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-id_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-id_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-is_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-is_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-it_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-it_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-km_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-km_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.2.1esr.bb         | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.4.0esr.bb         | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.2.1esr.bb         | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.4.0esr.bb         | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-or_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-or_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-si_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-si_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-son_38.2.1esr.bb         | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-son_38.4.0esr.bb         | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.2.1esr.bb          | 7 -------
>  ...irefox-l10n-pt-br_38.2.1esr.bb => firefox-l10n-sq_38.4.0esr.bb} | 4 ++--
>  recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-te_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-te_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-th_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-th_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.2.1esr.bb          | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.4.0esr.bb          | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.4.0esr.bb       | 7 +++++++
>  recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.2.1esr.bb       | 7 -------
>  recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.4.0esr.bb       | 7 +++++++
>  173 files changed, 598 insertions(+), 598 deletions(-)
>  rename recipes-mozilla/firefox-l10n/{firefox-l10n-ach_38.2.1esr.bb => firefox-l10n-ach_38.4.0esr.bb} (52%)
>  rename recipes-mozilla/firefox-l10n/{firefox-l10n-af_38.2.1esr.bb => firefox-l10n-af_38.4.0esr.bb} (52%)
>  rename recipes-mozilla/firefox-l10n/{firefox-l10n-an_38.2.1esr.bb => firefox-l10n-an_38.4.0esr.bb} (52%)
>  rename recipes-mozilla/firefox-l10n/{firefox-l10n-ar_38.2.1esr.bb => firefox-l10n-ar_38.4.0esr.bb} (52%)
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-az_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-az_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-et_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-et_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-km_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-km_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.4.0esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.2.1esr.bb
>  rename recipes-mozilla/firefox-l10n/{firefox-l10n-pt-br_38.2.1esr.bb => firefox-l10n-sq_38.4.0esr.bb} (60%)
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.4.0esr.bb
>  delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.2.1esr.bb
>  create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.4.0esr.bb
>
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ach_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ach_38.4.0esr.bb
> similarity index 52%
> rename from recipes-mozilla/firefox-l10n/firefox-l10n-ach_38.2.1esr.bb
> rename to recipes-mozilla/firefox-l10n/firefox-l10n-ach_38.4.0esr.bb
> index 93d535c..c5fd95c 100644
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ach_38.2.1esr.bb
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ach_38.4.0esr.bb
> @@ -3,5 +3,5 @@
>
>  require firefox-l10n.inc
>
> -SRC_URI[md5sum] = "b3340f36da92ddc1ccae6d31251b7090"
> -SRC_URI[sha256sum] = "285a30026c108ad7775fde79bcf5e84c6f0af5bb6dce747bd8d4be308d83c3bd"
> +SRC_URI[md5sum] = "4c7d6ad8483b35a975dcdccd98e41b4b"
> +SRC_URI[sha256sum] = "367e6432d3760e7403eea1ba3f59babd7846721812d51cc952fcfed9f62773c5"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-af_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-af_38.4.0esr.bb
> similarity index 52%
> rename from recipes-mozilla/firefox-l10n/firefox-l10n-af_38.2.1esr.bb
> rename to recipes-mozilla/firefox-l10n/firefox-l10n-af_38.4.0esr.bb
> index 11c6364..6aa836a 100644
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-af_38.2.1esr.bb
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-af_38.4.0esr.bb
> @@ -3,5 +3,5 @@
>
>  require firefox-l10n.inc
>
> -SRC_URI[md5sum] = "04ef0f30c7a80add9d098f700318d0ed"
> -SRC_URI[sha256sum] = "2939af5389d2d480ad9b0b5fd4e13d725a07b47f1e025d7abe232e25bd6f93f3"
> +SRC_URI[md5sum] = "4dcd9a161b9342a464db9f96acc88626"
> +SRC_URI[sha256sum] = "d88130018dfd2909551e1fdf93ef17fde5423218a1bc75cc051eadc828861d45"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-an_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-an_38.4.0esr.bb
> similarity index 52%
> rename from recipes-mozilla/firefox-l10n/firefox-l10n-an_38.2.1esr.bb
> rename to recipes-mozilla/firefox-l10n/firefox-l10n-an_38.4.0esr.bb
> index 4f582b7..db5aea6 100644
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-an_38.2.1esr.bb
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-an_38.4.0esr.bb
> @@ -3,5 +3,5 @@
>
>  require firefox-l10n.inc
>
> -SRC_URI[md5sum] = "bb214d187b1b5f0421f514db1eb97202"
> -SRC_URI[sha256sum] = "61c2b5e3037fca2759313b6a21c6abc056e8bd9f31f9781f5c6ef1289af5cf61"
> +SRC_URI[md5sum] = "d68cc61859a1e687529c37c3843fbb16"
> +SRC_URI[sha256sum] = "46a554e2edb3d825a8831551f2c6b939f45c545fba05e3ef0be2ac3c36dbd883"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_38.4.0esr.bb
> similarity index 52%
> rename from recipes-mozilla/firefox-l10n/firefox-l10n-ar_38.2.1esr.bb
> rename to recipes-mozilla/firefox-l10n/firefox-l10n-ar_38.4.0esr.bb
> index af44927..6aa6895 100644
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_38.2.1esr.bb
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_38.4.0esr.bb
> @@ -3,5 +3,5 @@
>
>  require firefox-l10n.inc
>
> -SRC_URI[md5sum] = "cbedb047d348391c9ff448222b757a14"
> -SRC_URI[sha256sum] = "840e732a96c8478d0815888c79496d1c62dcbd6133d2304b0920f93d0f6eb3db"
> +SRC_URI[md5sum] = "6516f465e60ecbc6affc476dd8c4ca72"
> +SRC_URI[sha256sum] = "aee825dee23f8aeaafe1775918d9a17384073836ef3a934c50580d9cab1116b4"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-as_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-as_38.2.1esr.bb
> deleted file mode 100644
> index e337c89..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-as_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "4caf5cac426b0a05b9bf558624a197d0"
> -SRC_URI[sha256sum] = "3aad4f54d6b17a1e50ecff8f88d43723fa7d423ef5523a01e80b2eedd4d40ca4"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-as_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-as_38.4.0esr.bb
> new file mode 100644
> index 0000000..043313d
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-as_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "608fd7faf915d00469556f666307debc"
> +SRC_URI[sha256sum] = "e0c77be1178038fc122951f6522d9c28377c862bed0844ac7e41b6c1b57aaaec"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.2.1esr.bb
> deleted file mode 100644
> index 7eaa382..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "bd81bcb212d21eabc1af24a87d7b14e1"
> -SRC_URI[sha256sum] = "9a3dad64dd09a11293936ad421d9cf54a112363497fcf2263e56fe4dc059b648"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.4.0esr.bb
> new file mode 100644
> index 0000000..28f8e98
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "3f56509e3f22226a9307e2e005e64eb7"
> +SRC_URI[sha256sum] = "895e06fdf8b0bd232fe89fb5254b9c2b114ff7bd8257a3a93062ce0549a2416c"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-az_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-az_38.2.1esr.bb
> deleted file mode 100644
> index c9d21c2..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-az_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "0b331d3504012e6c04ee07bd10ab6736"
> -SRC_URI[sha256sum] = "17a2771c37d08b1635de6bfbffb125191c046c21cf159b33fb596d9cd5ebfda0"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-az_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-az_38.4.0esr.bb
> new file mode 100644
> index 0000000..4983bd1
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-az_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "0188257a1ac4321e95929b073c180efa"
> +SRC_URI[sha256sum] = "903c9468cf859252d9201ab63b5ee430e46979eddb0b20b5e9bb7f7ef764b729"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-be_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-be_38.2.1esr.bb
> deleted file mode 100644
> index 029e2fb..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-be_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "1b6b016e358a09f2d6bf54ddbc8620f7"
> -SRC_URI[sha256sum] = "fd6d9e058da409985c1f9e04b608c897e3ccf81cff733029c4c6571e7d128022"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-be_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-be_38.4.0esr.bb
> new file mode 100644
> index 0000000..26c1b86
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-be_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "b09beaaf8ea1ac8ee47d3aea6682ec30"
> +SRC_URI[sha256sum] = "698a0ac8f2d802d55d55dfc55d6a870d9269a81e73506ba2ccbe9875e4bad00a"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.2.1esr.bb
> deleted file mode 100644
> index fc33644..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "252af6625a65ffa20f315fdb196eb430"
> -SRC_URI[sha256sum] = "389edc15450db4664667237ce42a7f207278777bf13fb7531ebba54a09df460d"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.4.0esr.bb
> new file mode 100644
> index 0000000..1e75c51
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "9061486552b2056947189a555cd88ba1"
> +SRC_URI[sha256sum] = "ed0f3767bca984504cd14925eac0a85555b794669fbab204f6b66565fe5572d4"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.2.1esr.bb
> deleted file mode 100644
> index be8bca2..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "618a629f13f44c171f38ec16835699bf"
> -SRC_URI[sha256sum] = "8acb41f8dce61a494f04e2d3f43eb0a23e7f21179928b803d6f0fac42ee1b4a3"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.4.0esr.bb
> new file mode 100644
> index 0000000..2d79659
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "eadce4faf22e60aa1b8619d10689541f"
> +SRC_URI[sha256sum] = "3b9130b35ba2dbee86e6b7cc7e1db9bf5e58ad58629c2c73ac383890602b1cf0"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.2.1esr.bb
> deleted file mode 100644
> index d6f83ff..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "ed59a8ec211f063e1e08992bb8c4c3dc"
> -SRC_URI[sha256sum] = "bab25d7ce5747110b39b2b99685853a5931f340daa2cb88a4d53b01b0534f211"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.4.0esr.bb
> new file mode 100644
> index 0000000..2b330a4
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "fea75baef297440280c1fd76106df050"
> +SRC_URI[sha256sum] = "23e256860312a7fd7287fb9734bb4cd23a054c7658ba50d0eb0a0aa59008ed0c"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-br_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-br_38.2.1esr.bb
> deleted file mode 100644
> index 85e82af..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-br_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "e8b5700de5aa3f914e33b8eb8d775b09"
> -SRC_URI[sha256sum] = "a5cbd1cbacdd7d17c7f0d5d62583a0174e69e0905ffb22d0b7a4e936729862c7"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-br_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-br_38.4.0esr.bb
> new file mode 100644
> index 0000000..60052a5
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-br_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "48e877882507d8a0afefde6f2705b97e"
> +SRC_URI[sha256sum] = "4db2bb1cb2e6ed5e97c30a387e3b1ee971ea5b8f9f62314806d9256439bffafd"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.2.1esr.bb
> deleted file mode 100644
> index d338019..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "987cdb03a568ce28195105d4b808090b"
> -SRC_URI[sha256sum] = "0b2752ae75b2306d5b01731cf470cc02da75b759ac7fd4b0bfbad76e85214b50"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.4.0esr.bb
> new file mode 100644
> index 0000000..0da2c2f
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "e853dc9ed6c20de5b81e3e3a69a9ff7f"
> +SRC_URI[sha256sum] = "aac006ad04fd94454de660eb22615386659c9d7cb76a76661c87c7fe9a0ba2e6"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.2.1esr.bb
> deleted file mode 100644
> index c8ea2e1..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "7bff27fdb28a69dc89b3e1e65add1d9c"
> -SRC_URI[sha256sum] = "9a7838b932bf3c356da9af568718ab058c86076e435f5d0be4a082bbaff190bf"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.4.0esr.bb
> new file mode 100644
> index 0000000..9c99f73
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "34fd3044b00efa993f701385828189b4"
> +SRC_URI[sha256sum] = "9abe8bdfc09c11bddcd92f052760edad97fba5396c535b3382f2add3b0ff6834"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.2.1esr.bb
> deleted file mode 100644
> index 4862235..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "292daba64a998206ad3780995eb9457e"
> -SRC_URI[sha256sum] = "d8c4ba79e4725029dc4073e065c65a8ba1d97fca9e2ab53f7147184211801178"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.4.0esr.bb
> new file mode 100644
> index 0000000..e6ab74f
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "47e38593e63d4cef6d9db97afa42c605"
> +SRC_URI[sha256sum] = "7e5c23a4e3926d2dc1d21ac59d616597312e2cd92a3e13322f0a8b767ebbf1de"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.2.1esr.bb
> deleted file mode 100644
> index fff1c7d..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "02366aa12fff5d3aff879521e32498c6"
> -SRC_URI[sha256sum] = "8916066abc92d6ddff59b248ffe79bc09e42ae2e553abee68cd96f81f7c9881f"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.4.0esr.bb
> new file mode 100644
> index 0000000..0a6148b
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "c2c4d3c195cfb900f35c4ed9e48bd439"
> +SRC_URI[sha256sum] = "cd6d186edfbfb28e9fd1a5629dbecd6f6cff3a664ef4402ba1aa6e78b0bcee94"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-da_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-da_38.2.1esr.bb
> deleted file mode 100644
> index b3fba18..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-da_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "db46087a504e5f6057e602fd6cd501da"
> -SRC_URI[sha256sum] = "269107b93e0f7df8b9860672ae5cddeb816bc184d8b083dbb0c12af4723da666"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-da_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-da_38.4.0esr.bb
> new file mode 100644
> index 0000000..0dd5f8b
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-da_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "cfe1f634c6efd8bdf9f4b3a2ecf2b270"
> +SRC_URI[sha256sum] = "0c01576ce10bafc4eb825cc469487df34ec305537bf8ff0a28023b3488d6a3d6"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-de_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-de_38.2.1esr.bb
> deleted file mode 100644
> index 30f12b0..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-de_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "4e88eec6d43dff85472a81e2c5e19e6c"
> -SRC_URI[sha256sum] = "3875513fb280bf215f37062078f3dee9e19b49cf43db4a1722975d086700fb9e"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-de_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-de_38.4.0esr.bb
> new file mode 100644
> index 0000000..38635ce
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-de_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "91c0bed9e96f018f9073a75a118ea473"
> +SRC_URI[sha256sum] = "7f69136d81c323374b0148c5d568d069824c21a550fd11df7516251982312a11"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.2.1esr.bb
> deleted file mode 100644
> index 2f3bef1..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "8992dde7c72291223751fd471a281ffe"
> -SRC_URI[sha256sum] = "f925101d6416e20725e7f20632d4e3c3c22131b2becfb393e7811d5dd8e849fe"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.4.0esr.bb
> new file mode 100644
> index 0000000..42d1679
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "2a5eb22d0b2e276ec377c1187d8962ed"
> +SRC_URI[sha256sum] = "cb3a5f1149b08ab063504d642181db5b23a31bd068d59a98a3e15e9f94934335"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-el_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-el_38.2.1esr.bb
> deleted file mode 100644
> index abbfd50..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-el_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "f71e2a26dec562f72d1e00b7f090d248"
> -SRC_URI[sha256sum] = "b0bece2e1762b042044e676b13ab33b5d8dc6397c84974ba485e656bfa859fed"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-el_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-el_38.4.0esr.bb
> new file mode 100644
> index 0000000..9b1a690
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-el_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "6a6d9f474400981a2b88ee6c78d2e0df"
> +SRC_URI[sha256sum] = "5ac04011963f07691b6406094efe3f16455c7cb952d08891e6a3d072789130e9"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.2.1esr.bb
> deleted file mode 100644
> index c48cac4..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "1b3bfb37f153df5b6c6fe00a632d39d3"
> -SRC_URI[sha256sum] = "8f5dbb40d08afd368f74204ace917bc13e384fa305b5a588f87aabd7da741177"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.4.0esr.bb
> new file mode 100644
> index 0000000..5d90819
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "c584fe3e9407e32bc9fa548b96bc5c20"
> +SRC_URI[sha256sum] = "21f4db34f3277636b6cc41be7508025e201fc9770bf962906eefeb04543a26ff"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.2.1esr.bb
> deleted file mode 100644
> index 1edb4ee..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "076e73314f9e24d78dd9eb5ff8f7a7b4"
> -SRC_URI[sha256sum] = "44e81da1c90cf56e4190145e981c7bab9d6cdc559366c7b707c01e0df84db7a2"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.4.0esr.bb
> new file mode 100644
> index 0000000..d1eb97b
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "e5dd4b266f0f84a5b910bc30baead791"
> +SRC_URI[sha256sum] = "fa4b38cab1689369da78e317a2dd8aeb2c5c9575a3a3bb971118e2c9e1984f40"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.2.1esr.bb
> deleted file mode 100644
> index aaaf239..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "041d513db4293296835935d814679400"
> -SRC_URI[sha256sum] = "d4d06c2c80202f06a837dcea7e0431f8556a58e7a97e5e1bdd41ef8cd575f8db"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.4.0esr.bb
> new file mode 100644
> index 0000000..ab07b02
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "598812537f744566f4a07d14b7ca6d77"
> +SRC_URI[sha256sum] = "1de92cc4b659074953146880f26090d060030734b050ca4e9e99ca082930ee3f"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.2.1esr.bb
> deleted file mode 100644
> index 117ab31..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "e91ecbe1d03e81c70c813fc9503dd99c"
> -SRC_URI[sha256sum] = "34d5455052f0f7e43561795998b9a9f20683bbdac54d740e2ccc952dbe35840a"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.4.0esr.bb
> new file mode 100644
> index 0000000..43dcf5a
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "b42d5100b48aafea0e076c22f87b1da0"
> +SRC_URI[sha256sum] = "bda681afa425465404fd3b3ee3e5ddc78da046884ad1288478f3567ad23f6cc4"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.2.1esr.bb
> deleted file mode 100644
> index 2a87a65..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "8e2f2b4843c0336c2839706937740881"
> -SRC_URI[sha256sum] = "1539d6b82a8a475fab958de03819b9ab866531d826248882f70dbedb52caa095"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.4.0esr.bb
> new file mode 100644
> index 0000000..a827195
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "3a4ed286cbe1934316357f6479ebefa7"
> +SRC_URI[sha256sum] = "39e09539cbdb65176f5f7505ed717bb6621492eaf24782a96beec3059a06c8e7"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.2.1esr.bb
> deleted file mode 100644
> index d1757d7..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "e2982afa0e676243ea54d47187f25202"
> -SRC_URI[sha256sum] = "987c370767ef39c784977f15768a79833052cfccf53b90ab0ade524270fc299a"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.4.0esr.bb
> new file mode 100644
> index 0000000..6576046
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "015d30b4be97fc44834747b4253c6305"
> +SRC_URI[sha256sum] = "519db83d328d45e0617e191a03d6eeb852f6fb78266aebb7b5fb20c788d1043b"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.2.1esr.bb
> deleted file mode 100644
> index add7fff..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "3456c9c9e05ec0c5cf867e19fa599112"
> -SRC_URI[sha256sum] = "db861b6fb4eb4b46cf21e3fc56ec3ba98303cf0aa8c2d5c1fa4efacc93342400"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.4.0esr.bb
> new file mode 100644
> index 0000000..90a53e0
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "7ab971530760d84d3c31d11285fcd9a9"
> +SRC_URI[sha256sum] = "b39ef0e44adba821e4f9ded5d5bc3fad5f6970e090453fa509b104bd84876b00"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.2.1esr.bb
> deleted file mode 100644
> index 1c23d3a..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "7db3ffbf3758d76bf267aaf64166dfeb"
> -SRC_URI[sha256sum] = "b78492a8826850ef2a3f7d7c192c15af573b59c64871a2b849c98277eea28234"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.4.0esr.bb
> new file mode 100644
> index 0000000..dd3369a
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "a1a531af84787d7819d45e0dedc9668d"
> +SRC_URI[sha256sum] = "c7db8de566c0b4d0ae916877145e0766919379c583405c5ab3f395ddae4dcab6"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-et_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-et_38.2.1esr.bb
> deleted file mode 100644
> index b466f07..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-et_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "aba46aee29fdb4b476e36f9cc6bc28e7"
> -SRC_URI[sha256sum] = "fe133da93e7c1e88f1c39321de56f679db228e7a0b7c6cd08ccbec09579cb9ac"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-et_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-et_38.4.0esr.bb
> new file mode 100644
> index 0000000..1e20519
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-et_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "4e75622a5a8c06cd40bd50d62517637d"
> +SRC_URI[sha256sum] = "c0ac4b4ef61e1ca128b63fb88410788c9aaf54e0c6a8012be379d093f465fe07"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.2.1esr.bb
> deleted file mode 100644
> index ec43245..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "9c0872f6e5841b512cb27be095dfeabf"
> -SRC_URI[sha256sum] = "4b34e8fcc664fc47de1ee7fe1b8c4054a8416288a89198f1e772d37bdb0d6dad"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.4.0esr.bb
> new file mode 100644
> index 0000000..01ff342
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "9b6e89d6334a2daa82b4b4aa2b91b333"
> +SRC_URI[sha256sum] = "fa7ed638416b030a54104bfaa399aee0670cbcb9066a7accd3ecb543dcfc6774"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.2.1esr.bb
> deleted file mode 100644
> index d0cb43c..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "5883de41dc730131ba2ee3cf401a04a6"
> -SRC_URI[sha256sum] = "6525afff18f0e5e76ba8daa67ee86121998ba3fa199215aa207b83759a7ca616"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.4.0esr.bb
> new file mode 100644
> index 0000000..1d648bd
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "7d92e3fc4fa50c66722260053662de92"
> +SRC_URI[sha256sum] = "6229f7ff2312dba7678b51d7b63b66c76bf0f044065149393627513bb0939fb0"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.2.1esr.bb
> deleted file mode 100644
> index e8dbb4f..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "af64233de09fd19b9d54dac5ecc51e23"
> -SRC_URI[sha256sum] = "bf57f779d89cf4e72ed1d4c7b6100facf28ed829dc96f60dd5de52d4289bed04"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.4.0esr.bb
> new file mode 100644
> index 0000000..cd168aa
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "e78d0a09d0e9a7b04fa23db3dce3e041"
> +SRC_URI[sha256sum] = "acdc6ac3318a9fefa6fe86ea4449cc58b2e5fa251ee9054b65a77ba6fa6203d9"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.2.1esr.bb
> deleted file mode 100644
> index 9dbef81..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "7b531ebf00d31f19dd17e408f5208115"
> -SRC_URI[sha256sum] = "0930c3a33eb29d31789e7a880a018912da6ca4e9a51013e08bc311d775f4021a"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.4.0esr.bb
> new file mode 100644
> index 0000000..0fdb31d
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "777f7f0329210450ebdc79e6dad363e7"
> +SRC_URI[sha256sum] = "bf1fd7170359bf1dde30bbb6e67df575ee7ac26bd26d2d3627c12688cf689dad"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.2.1esr.bb
> deleted file mode 100644
> index 859b2f9..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "63bb96395ae1544d28d8db39a056f63c"
> -SRC_URI[sha256sum] = "459b100943ac236091e5945aa84047c7a0b540769c8d63cf2f527cbbf645b401"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.4.0esr.bb
> new file mode 100644
> index 0000000..6a0cf22
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "dbd6834e4ee22f1a06f3c22dda89fd76"
> +SRC_URI[sha256sum] = "1609e9fff4c9f221553628be4d64c3d70e7b55fe0120a049d27f7aaaa129590e"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.2.1esr.bb
> deleted file mode 100644
> index aac9839..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "b6e26926d38ee8299227b18d2e902abc"
> -SRC_URI[sha256sum] = "23cc544e74606aa72e9ad2d9c3bc2ae835c82a2bec5787a531e5913dce110d18"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.4.0esr.bb
> new file mode 100644
> index 0000000..42e7acc
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "c5939bc8e2f461c19d7629381fda0d8b"
> +SRC_URI[sha256sum] = "e8cac9a32aea385bc389abf2e15722295de61776a4cc098e65c6b5b512d1ad89"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.2.1esr.bb
> deleted file mode 100644
> index fbbc436..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "acb74472744f8f3046e9122a7bcb92c0"
> -SRC_URI[sha256sum] = "0e45539bd39deb9315070726b44c01a8c12c9edb0d1773dc62bc606c45263500"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.4.0esr.bb
> new file mode 100644
> index 0000000..36c6a4c
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "08d0ab34506d3ec89bccac86ce8187d4"
> +SRC_URI[sha256sum] = "b5ac39f748c770e2208cd61a83819b42d1dff136e6dd5af230f7eea51d542ce2"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.2.1esr.bb
> deleted file mode 100644
> index f0350ff..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "3d260ad74005ede4cfa5d2ae59e47614"
> -SRC_URI[sha256sum] = "7d0af6433a55c2b066f136de7cb2e19182f2357d7e48ac7711dc0dea17c27f8e"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.4.0esr.bb
> new file mode 100644
> index 0000000..4e1a074
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "c5bbe4351cb586659845d67463f89a26"
> +SRC_URI[sha256sum] = "964f0c93adde0188ff3664c73ab04bb2e50201a7e4156200e4d471ef9a10772d"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.2.1esr.bb
> deleted file mode 100644
> index 5d22052..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "f8e55dd851264f7e63120034c6f9a813"
> -SRC_URI[sha256sum] = "9253cb864e13ad8f86350e3560a08705e3b411f5afb69b66fcc739571a5a9697"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.4.0esr.bb
> new file mode 100644
> index 0000000..e4f6b1f
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "d00374915a5e5b1c74b9c41b16d03861"
> +SRC_URI[sha256sum] = "2150be83227315de82333e41e5496da5d3b823645a98404ef31d2cd98f6bd1e2"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.2.1esr.bb
> deleted file mode 100644
> index 1d5e762..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "481187abc298353846d90fb7b087dcfe"
> -SRC_URI[sha256sum] = "e926a61de3fbc8f7120bb07fb0450cce81d9da6842bcd5fa7a8df1499fa11013"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.4.0esr.bb
> new file mode 100644
> index 0000000..ae2d07d
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "0158f7689b40d82b4045e6e35a37411f"
> +SRC_URI[sha256sum] = "4a6b29fc389af54c294f5cbba27780aa6a5e63329af5d1407f42ab240462099d"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-he_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-he_38.2.1esr.bb
> deleted file mode 100644
> index b006d1d..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-he_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "499ae56c575e652c582d203db87143c3"
> -SRC_URI[sha256sum] = "b14462221fde67c0fffd2fa0469e6c5a476540111088456842a59809e1e6812d"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-he_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-he_38.4.0esr.bb
> new file mode 100644
> index 0000000..aa784e6
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-he_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "dd7b5755979620b86b5f1e9937466e35"
> +SRC_URI[sha256sum] = "2fafcb398ae4ad3aab1498fd22f8ab713f966f96753301fc2385f0c5d0ab1568"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.2.1esr.bb
> deleted file mode 100644
> index 449d4d1..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "7ca721d0d07bce558b9258fee37b5558"
> -SRC_URI[sha256sum] = "df8683b412ccb2d4142099354b0759e59306eb96be12760c7c0f58b7b48d9411"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.4.0esr.bb
> new file mode 100644
> index 0000000..21976ee
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "5514e3cb8d61537ba69d981df8ddb529"
> +SRC_URI[sha256sum] = "c2b5eed1fd8ad921f79feaca0ad43ac969e3171e8d1d579ae99c2c1c17202379"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.2.1esr.bb
> deleted file mode 100644
> index 32c654a..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "ed01e4d1a2bd26767578b62c10063207"
> -SRC_URI[sha256sum] = "2405e5459c45abbf455845eee66bef90460f4c5c34aa1abede38737d2d8bbbd1"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.4.0esr.bb
> new file mode 100644
> index 0000000..6f7ba3c
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "66bb68e84b65b01c8e20cdb8a9a4d29b"
> +SRC_URI[sha256sum] = "1f2d14ece4cd0cad5cc7265a12498f669397b220b335244b70c62e826eda720d"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.2.1esr.bb
> deleted file mode 100644
> index 9a43418..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "d7386677d411dcc060054bca07f448aa"
> -SRC_URI[sha256sum] = "a6852cdcecddcdc36ddcb33513bf6df0f39734f8ee174c52c3b46c0e4284d06a"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.4.0esr.bb
> new file mode 100644
> index 0000000..7645f0f
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "2c034166c1f1f6340f4df67b5c08d25b"
> +SRC_URI[sha256sum] = "ec5fa60642854beacf8a031b17f6657c55666cd2fcc025829fc94c0ceaf671a9"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.2.1esr.bb
> deleted file mode 100644
> index 4f9a647..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "401716d1fb94ec5b4ae6cdba3751a298"
> -SRC_URI[sha256sum] = "7dbbebe69ff4ae414909e02eadefd1db7b7585ebbf450c6906e515cd55ef5144"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.4.0esr.bb
> new file mode 100644
> index 0000000..ac709c0
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "c18f949f994dcfb8050e739f9a0ae699"
> +SRC_URI[sha256sum] = "1ae11147ddd2fcd7c4235713a19ca4a31ff6b77d313b1e139f66627b5b839cfc"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.2.1esr.bb
> deleted file mode 100644
> index 4f99b3f..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "8129c59bce70314602fd91bf7676ca19"
> -SRC_URI[sha256sum] = "20a4c0b5abad43617850551aeb00c303fb74a11cb0ffc88a5f6a21500e0c707f"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.4.0esr.bb
> new file mode 100644
> index 0000000..dd2ea4f
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "d110b03a8f07811571a008c98331b13a"
> +SRC_URI[sha256sum] = "e109740e0837c75732fa40c124b51355ed7cc3cd0dc4ec6a9f078298674c215b"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-id_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-id_38.2.1esr.bb
> deleted file mode 100644
> index f9e3d2b..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-id_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "f9cc484a6054bf50a39c88aaf03fb9d4"
> -SRC_URI[sha256sum] = "bfc5fe681d846d57ff34b69916a2a67182a020652d7c4949f6835e84ea296f22"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-id_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-id_38.4.0esr.bb
> new file mode 100644
> index 0000000..a276b04
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-id_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "9536cb823ea0d8f1f7e6a9dc8ba48285"
> +SRC_URI[sha256sum] = "60220cae6623614bc6b11667849ddb5f2251c4b8f4c0bacf99bfa81c4a407d4e"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-is_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-is_38.2.1esr.bb
> deleted file mode 100644
> index 03a5e13..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-is_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "80062bac297bc0f5046bf90fe3c2cf38"
> -SRC_URI[sha256sum] = "7db45517845cb2c10240e8bc208aa98eb59ca9f7e4ac63458ff73b01c6f81feb"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-is_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-is_38.4.0esr.bb
> new file mode 100644
> index 0000000..ccaee76
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-is_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "23e007aa74f6ecca5865da689907b6a5"
> +SRC_URI[sha256sum] = "20e4a96ac76793eadfc43c5094f92aae81fc439fb0df94204b48bbd022df5247"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-it_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-it_38.2.1esr.bb
> deleted file mode 100644
> index 511e44e..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-it_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "7f56b9af9523ff1e23cb558dfaa6aff7"
> -SRC_URI[sha256sum] = "0b34622317c71e5d4ef73a2c91103c81bb93e00ec6745d815f5b5c5e0a4a80a4"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-it_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-it_38.4.0esr.bb
> new file mode 100644
> index 0000000..5d9b078
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-it_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "20ece8b060f8b060b3335184f000ce2f"
> +SRC_URI[sha256sum] = "c3038ebd54153273d4d510dda53f144b2820944231659ad3e01dccabd53d0a6f"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.2.1esr.bb
> deleted file mode 100644
> index 4f742c4..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "fca95afd94c93c298efaee1f202d7fa8"
> -SRC_URI[sha256sum] = "7df70432dfaf748eea5edfad608a3fcce377f1c3d06d1012f2fb28042f872ae8"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.4.0esr.bb
> new file mode 100644
> index 0000000..e04a087
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "43f0cc70f4e9d4c3f20b3785f17d2773"
> +SRC_URI[sha256sum] = "eed8773e7f2b2706884ef844805a3ff4d8efb20a800ed9b1359e392dc6f365e7"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.2.1esr.bb
> deleted file mode 100644
> index 800fa4e..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "ecb7c10c79629c19d9fdb5d18fcff6e5"
> -SRC_URI[sha256sum] = "07131063fc5caa3a3f20d9f6140d3e0640c81e842389cd77c26ed722ddb195b0"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.4.0esr.bb
> new file mode 100644
> index 0000000..ac8eb10
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "698d78ae51e4211704c44ecd5ab4ad56"
> +SRC_URI[sha256sum] = "1ee8d139df0b85421f9319976200f7e982106d7dbdd13e0763e4f44748828da4"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-km_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-km_38.2.1esr.bb
> deleted file mode 100644
> index 95ed77a..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-km_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "c598844b8bc47b95a2b7d1dad6084f18"
> -SRC_URI[sha256sum] = "35c67ac083036edbc00351f3c75b6bd59a57f49b8f49326b966e49ed1c440769"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-km_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-km_38.4.0esr.bb
> new file mode 100644
> index 0000000..84b5873
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-km_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "bc6abbc8451966dfcd8571d472da5e6f"
> +SRC_URI[sha256sum] = "c6adbc64a942764b10f4cb44ea524d6ee3ac9fa82b23ab856abe8ebdef6c3abd"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.2.1esr.bb
> deleted file mode 100644
> index 7c6fb0d..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "8c54e90044ed34b49585ef268cd62228"
> -SRC_URI[sha256sum] = "b88e298f2e884a027a993b1e08bed8d4b693cc86d0cd9593570cc83561e9ebc1"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.4.0esr.bb
> new file mode 100644
> index 0000000..04b9ffa
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "e39c98248be86346dcb4e61ba2e5f201"
> +SRC_URI[sha256sum] = "029c65dc35f6b7e4b1f9f4ce968fd239b8a5ec79dedabff81d167fc91fffd4a3"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.2.1esr.bb
> deleted file mode 100644
> index efbfa3b..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "b166bbbe2be2034d9f2e7b928960e296"
> -SRC_URI[sha256sum] = "bb7f4562361941f1f6cb5f157b52a0c8584e52eb8b1e0d643b00dd7bb0b5c51e"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.4.0esr.bb
> new file mode 100644
> index 0000000..b60ded1
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "c3f2f41721c61f1255d8822eb4d1c270"
> +SRC_URI[sha256sum] = "89299b59c51db6b5d0d55c03df290f1b3cc2cce728e2ff21af352c2b568ea44c"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.2.1esr.bb
> deleted file mode 100644
> index 63bcc7d..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "2ef0c41cfb132fe867b7e9a0d5a752c5"
> -SRC_URI[sha256sum] = "c5ee43e5a4a14d8476dfc7299a6f87ccb91aca8c954b85168a9248d91b3e3fde"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.4.0esr.bb
> new file mode 100644
> index 0000000..24fd6b8
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "43f85ac05b518bd46d535166da06d5a6"
> +SRC_URI[sha256sum] = "68f9d1abd49b20a3b3bd79d4b7ace1099ab8b6d9cb094a84bcabd90cd3a4142a"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.2.1esr.bb
> deleted file mode 100644
> index 942a133..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "2bfe6afc4cb4ff57d992b47684cdbebd"
> -SRC_URI[sha256sum] = "285abdd84d600b7aef0eb17371879573772e357d147178d02cbb9004cfd01d70"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.4.0esr.bb
> new file mode 100644
> index 0000000..0b1a181
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "51e75814782dc6a330363911d62a061c"
> +SRC_URI[sha256sum] = "769c238f3d90b896e6e6bc0b04ed29e348e4a60a08df49f28f943358ad036063"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.2.1esr.bb
> deleted file mode 100644
> index 7820bac..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "da470c7f53420628a3331ff8050776e7"
> -SRC_URI[sha256sum] = "b5b427806e1b7172110b0570fe381bd40486790c415dfe8720343c2a34c41a64"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.4.0esr.bb
> new file mode 100644
> index 0000000..46bef90
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "af6b94c7f5ec7597b4df00f7af5f9586"
> +SRC_URI[sha256sum] = "0b90f73e86ca10f69d0f06819f7fe226a84886d42f10e653133bdba67112f61a"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.2.1esr.bb
> deleted file mode 100644
> index a87b4bd..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "a51f1b1d44f493a1d2320530b56b4f82"
> -SRC_URI[sha256sum] = "443c2edd6fec5e81d19552ba514b2dfc8330285fb0f984fc735f4a1b5de6a4f5"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.4.0esr.bb
> new file mode 100644
> index 0000000..3eba342
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "4a4773371a87963be438f06b460e3d17"
> +SRC_URI[sha256sum] = "d62055e9c602e3d5807cd6ebca9626d2f31bea3155c59a0eb1a8c2fde746d24d"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.2.1esr.bb
> deleted file mode 100644
> index 269e173..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "e1ffc30646f180eab48f0f59b1f37715"
> -SRC_URI[sha256sum] = "b57c5314d1b3824396a0cf6a4bc7d8cb70bc01730443dfa791bb393969841daa"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.4.0esr.bb
> new file mode 100644
> index 0000000..bedcc3d
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "425880264868b9a4ab8724e287455e9d"
> +SRC_URI[sha256sum] = "968070d4aee6819afbbc303e215b21afe2884a3004dc7d7696113b01423166da"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.2.1esr.bb
> deleted file mode 100644
> index 8d5ec0d..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "40e313dbcaa09243b3edf95cd4b1de9b"
> -SRC_URI[sha256sum] = "f55fecbcb7a2624dfdb557584c962b04e0b54bede3bb007cfdbb28333022fadb"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.4.0esr.bb
> new file mode 100644
> index 0000000..fc1c83a
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "23c7cc86f7110e5d4b261c17f6ae9ee3"
> +SRC_URI[sha256sum] = "01fa6077c6c05be1ce76db8e44b2c8462fe0a7a7818b1ddf9f6b2fa0d44c41cb"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.2.1esr.bb
> deleted file mode 100644
> index 86d7fa8..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "f6d1f5bdeb64cd2719504875e4818fef"
> -SRC_URI[sha256sum] = "16d656c2094e2ef767d4d6a3b6e290d10db4902f71dc8c2e9b1410358bddcac8"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.4.0esr.bb
> new file mode 100644
> index 0000000..cbf4069
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "56987988750e80ce1d860854339f3eb0"
> +SRC_URI[sha256sum] = "59ffe1bbd930b12681e2576b77e01ff4dc2aa79250e2f3f460264f8b68b6f1de"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.2.1esr.bb
> deleted file mode 100644
> index e517ce9..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "86cc118c67f34ba0bb49965db7f61b8b"
> -SRC_URI[sha256sum] = "d57d83cb9ea23ab30eada256ad77648a8a922bff52016ddd0956c223011d99a2"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.4.0esr.bb
> new file mode 100644
> index 0000000..08d2c66
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "befda7a6f57ef5ab1df782f9bcf5cd84"
> +SRC_URI[sha256sum] = "70dff1a3bdcdeba70d01e9e7d86191d0ad81bd1cf064e98b227f1734222e0729"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.2.1esr.bb
> deleted file mode 100644
> index 861128e..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "8118e13a6890a350c7829adf15863566"
> -SRC_URI[sha256sum] = "ff22df16587ed823ddbd422ef92492737e5a995a776413017c688f7b2f5cfb6b"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.4.0esr.bb
> new file mode 100644
> index 0000000..936793e
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "e46c0154bf49d3b2ada9c0389a060b1d"
> +SRC_URI[sha256sum] = "61c1be8e542963a86a799a1842557e334d62d0121ee259ce52eb701d938db2d7"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.2.1esr.bb
> deleted file mode 100644
> index b956e1d..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "7454d404a0fd129dc26ddda889e18c81"
> -SRC_URI[sha256sum] = "294d298024e333812504bbd269f104ac362e32f5b71b4bcc21591acd05cb52a1"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.4.0esr.bb
> new file mode 100644
> index 0000000..85769e8
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "05f079b75bb891e229803b86441a066b"
> +SRC_URI[sha256sum] = "6f09424512979109b8e2292de57fedb9753d293d550f35114402630b7fc93340"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.2.1esr.bb
> deleted file mode 100644
> index 65231bd..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "995e5b9cb696606596c4225ba9700ff9"
> -SRC_URI[sha256sum] = "c445a5f538cec05c69d2a7838f22e18123f34d7217454984ff9c02a7072364f6"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.4.0esr.bb
> new file mode 100644
> index 0000000..5ae5b2b
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "a6d32607401f1010740b7178c334d578"
> +SRC_URI[sha256sum] = "6e90022dbfdba748891f6e28582cab5a4b0287dd0c46774f9020250097eff4d1"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-or_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-or_38.2.1esr.bb
> deleted file mode 100644
> index 989a1a1..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-or_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "1e0740a8cd00bd617decbca128e2cfc9"
> -SRC_URI[sha256sum] = "af6d63813c6870ac5993860940f06c91611fed21cab87da34f7dc58d566fc751"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-or_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-or_38.4.0esr.bb
> new file mode 100644
> index 0000000..6c57685
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-or_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "69765d38eb20b1e0deef24c426bc245e"
> +SRC_URI[sha256sum] = "3866337ad94d5ece643389ed7654d266d14b689674b92fbe4f87db1a11608419"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.2.1esr.bb
> deleted file mode 100644
> index be4888e..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "14e1cfad168a0a3ed575ef6918deaf9e"
> -SRC_URI[sha256sum] = "adfea7204e49f629aa1432364cbe876b2a40b339e4279fa9801d650d17920aaf"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.4.0esr.bb
> new file mode 100644
> index 0000000..53511ab
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "15c9b211dc61bcfca544048e20b2fc64"
> +SRC_URI[sha256sum] = "c39aeb6943b6e9a83d5f2d499683e8125cbe4a585b3c14bf357664def646cb81"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.2.1esr.bb
> deleted file mode 100644
> index afcd982..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "2a87ee81792fe17e0aaefbce043fa9b6"
> -SRC_URI[sha256sum] = "651bdae9f95b09fa28db0dc6c47aec3271d628d2ba508797750a5dfbfdb6af8a"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.4.0esr.bb
> new file mode 100644
> index 0000000..c1e3d6c
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "f6ddaabe65c9824d0afd5a3aba2c51c1"
> +SRC_URI[sha256sum] = "cd5d694904802f1aa51d84390423f37500bbe6d2864e47bc0e09d2bc19a2c54d"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.4.0esr.bb
> new file mode 100644
> index 0000000..77363ae
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "47a86e5ed19f9ae232d55edba1821e1a"
> +SRC_URI[sha256sum] = "4ccd547e9ac19788c99ae876bd829e349e22be55aa9c2e194547d6986aa20209"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.2.1esr.bb
> deleted file mode 100644
> index 1d9cbbb..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "9e34fb9be6d4875ab5f93221ef27d38b"
> -SRC_URI[sha256sum] = "6f950c7eea881dbcd2f4ae4cce41f6ece38add5e511c741a6192c1431b6dc49f"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.4.0esr.bb
> new file mode 100644
> index 0000000..550f9df
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "b0e592815c6a936a278e0391cb32bec8"
> +SRC_URI[sha256sum] = "eed43d8ae9b455983b05e288f7368114b6caf92ff801b1fd22e4bbc49bbb7288"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.2.1esr.bb
> deleted file mode 100644
> index 224d76c..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "b24520463c1ea8f25eceb197620a5199"
> -SRC_URI[sha256sum] = "5beeafba0a7a1cf2bb14de27cac8284ac713712c3584e2d056bda5fa10d754ae"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.4.0esr.bb
> new file mode 100644
> index 0000000..ce81908
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "936c0d37dc58000f75cc4cbac7d146cf"
> +SRC_URI[sha256sum] = "5d91ca7d0f27ecee359d0a49be2d26219d15b985cee981fcb64c0bc0c4ba0022"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.2.1esr.bb
> deleted file mode 100644
> index 0db9efc..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "1989bc8f199424924d03987fb93eda72"
> -SRC_URI[sha256sum] = "d086f67dc27bb06c194e12bc0f47e52b58584637916da61c42da977204d6739f"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.4.0esr.bb
> new file mode 100644
> index 0000000..10e245c
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "311662c41432eb1a8cdb25b48c4f5fd0"
> +SRC_URI[sha256sum] = "fe39cc3c54be8647bce103e6c0f04e8ebbe842a65e3c916aa82660f1b4a1cfe6"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.2.1esr.bb
> deleted file mode 100644
> index 82900f3..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "402b2412a87c468a2ab5c106f40decd6"
> -SRC_URI[sha256sum] = "d61806e7f8080d3fe3b57baf9448ccbf74fb9a668365518322b0fd2fe67a75e2"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.4.0esr.bb
> new file mode 100644
> index 0000000..f2cdebe
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "f0031874e52288d93a419d798b9c6b2e"
> +SRC_URI[sha256sum] = "b31e7ffac7efc34e4d1672095f716f0cba43860fac1e596b7023be78a8306b74"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-si_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-si_38.2.1esr.bb
> deleted file mode 100644
> index 2b26f93..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-si_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "c05a70a624034541c4300429820db864"
> -SRC_URI[sha256sum] = "4d48d93f3a97a0b2853c1aacffb726bf49c32822069904fe419ff3fb9f04bcbd"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-si_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-si_38.4.0esr.bb
> new file mode 100644
> index 0000000..5cc3e11
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-si_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "7670c1d997d5f49d122409f3142bab6c"
> +SRC_URI[sha256sum] = "50692d44a2f2952a3dacd36f34c6b34e85cd16d9d13f795719e86e8afd59d62c"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.2.1esr.bb
> deleted file mode 100644
> index 231bd7d..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "a9e5ba044e1be63c712b4918eab512bb"
> -SRC_URI[sha256sum] = "f1b47a7c848a1d25f5bb3744497a94807e550c96e2ce34f06a07055e0eb5879b"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.4.0esr.bb
> new file mode 100644
> index 0000000..fd60bee
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "73eab1c85ccda56b67e383e8572b1785"
> +SRC_URI[sha256sum] = "245d5150c762c0c7206dd2f8869b2a8a8b734d0b48ece4985d332815ba71691d"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.2.1esr.bb
> deleted file mode 100644
> index 51354e5..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "75ef053f058810024dec94035b0c93ef"
> -SRC_URI[sha256sum] = "c663bf7ec450a45c3c1ee7a46e89facfc43717831e014f077e4fb994bbcfbd1b"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.4.0esr.bb
> new file mode 100644
> index 0000000..caac419
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "384eb47f96d9b6c89a69673a78aba05a"
> +SRC_URI[sha256sum] = "84f23d6d865f70f1e6701ac34bdf4f894f20d31fb098cbadb4bc0a3d7182e60c"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-son_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-son_38.2.1esr.bb
> deleted file mode 100644
> index 10e814a..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-son_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "40edd000dc65fd886a562908cb1d8546"
> -SRC_URI[sha256sum] = "305df206828887322e4f3d4c689224e1187e2a13b16dbcad898b2a3aeff5f25e"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-son_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-son_38.4.0esr.bb
> new file mode 100644
> index 0000000..28989a6
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-son_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "5b6eac8b4e0a91ae79f71383d251dcb4"
> +SRC_URI[sha256sum] = "75ef6f5fba0b8174ce1d6415579b57153bf60551e89c05632dea43e5a6044a96"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.2.1esr.bb
> deleted file mode 100644
> index aef40ba..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "be9dfcfad0864437c7e3556c99f8ac9a"
> -SRC_URI[sha256sum] = "2674faca4612734588e56946796c58725016082689e026ca8b805249447c97c2"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.4.0esr.bb
> similarity index 60%
> rename from recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.2.1esr.bb
> rename to recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.4.0esr.bb
> index 2524662..20f06d8 100644
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.2.1esr.bb
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.4.0esr.bb
> @@ -3,5 +3,5 @@
>
>  require firefox-l10n.inc
>
> -SRC_URI[md5sum] = "4ac6860f8dc1d4fd4eca3d4724d805d0"
> -SRC_URI[sha256sum] = "c4c0744d55113c5cf6ecf9c4ca2a283f7b63a4d6ebd952b0c271f5932cb50120"
> +SRC_URI[md5sum] = "6f62d4bee821200628959218d5a39189"
> +SRC_URI[sha256sum] = "4e9da99e5dd7b2fbb5e5627c91415ef39d1fca7e7ae1a423bb5830b37bc423e9"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.2.1esr.bb
> deleted file mode 100644
> index 4104cfe..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "2703e285bbfc2a622ae0d112516eed73"
> -SRC_URI[sha256sum] = "499f11c6a5f8dad76dda59bab9007daddae5a878e16e2a6fc4da46319dc66644"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.4.0esr.bb
> new file mode 100644
> index 0000000..30b36f2
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "e27a3b883a6044a6534c8c7fc419bddd"
> +SRC_URI[sha256sum] = "2447105f3d0850f8d7aa402196ed34df8e5dcb52291900dc03f1d79f04ffd1cd"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.2.1esr.bb
> deleted file mode 100644
> index 61193af..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "1249eae2178150978dd699dda16a65d1"
> -SRC_URI[sha256sum] = "536084e596a969fc8d26c497b1155a3a41f393cd86fb8c962e75b142247dbe11"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.4.0esr.bb
> new file mode 100644
> index 0000000..70e8ea5
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "075820eee6f9f63f93824875ae5ac47c"
> +SRC_URI[sha256sum] = "cb330410d3894b7b786be927d94eda5f9cb606682ee5cd3ca44eaed5a5a36dae"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.2.1esr.bb
> deleted file mode 100644
> index de61cd0..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "66331b24b78504b6852a03f28e3cb0de"
> -SRC_URI[sha256sum] = "639fb75e4d13ac50db0e70d35a92571353339c004a8bcf2ebb5e348896f57d67"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.4.0esr.bb
> new file mode 100644
> index 0000000..02daac2
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "810231b34263d97883966186320013d3"
> +SRC_URI[sha256sum] = "5ed639206c9b42064972edd8296163ebb517843aafab2cd6d5e1dbc2ae72af89"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-te_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-te_38.2.1esr.bb
> deleted file mode 100644
> index 5ff9f41..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-te_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "495cf4ef07cfeaa8cadf67e9c3fce19c"
> -SRC_URI[sha256sum] = "3b73a6b26d29260599d2d2b24a7bc0809a644de1e8347e60ffd4c5014109d0dc"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-te_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-te_38.4.0esr.bb
> new file mode 100644
> index 0000000..1a4b069
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-te_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "9d05693bbf607f619f410d54468557f5"
> +SRC_URI[sha256sum] = "e8d4352c5aae8a0134eaef285d1a29264ecde26362725fecdfa156033353e834"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-th_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-th_38.2.1esr.bb
> deleted file mode 100644
> index b75d181..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-th_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "ed06d876015e36233d1c0fedc7f0fd5b"
> -SRC_URI[sha256sum] = "a5975df8f977fcfc7e36a2ea53db17d15d1a409f1757922cf02e08895564a054"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-th_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-th_38.4.0esr.bb
> new file mode 100644
> index 0000000..f9618b7
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-th_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "ce5b277d6087f94fcaf40b9843cbd560"
> +SRC_URI[sha256sum] = "2404ecfd24b2dbbcad006316599a6f2cceb687cdfca97186f2756c4a2dcfb257"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.2.1esr.bb
> deleted file mode 100644
> index 29f0139..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "0e23be6e06d6fb4bc489dffa377be071"
> -SRC_URI[sha256sum] = "9f508923bdcd00b802bb9fb6d20cbd69ca87ba441e9119ffb76b243d7ebb78b4"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.4.0esr.bb
> new file mode 100644
> index 0000000..2524f4c
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "ba33a962ea6c66aa39d7bfaecc1abe76"
> +SRC_URI[sha256sum] = "f57103f13eabc494778c281d8d0eaf81a9a9c63f09ae5bdb8a3eacbdcb00a05e"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.2.1esr.bb
> deleted file mode 100644
> index 2d8d596..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "180b92774aa07443f551806db7695635"
> -SRC_URI[sha256sum] = "7b7b1216c9a5633ff4b4cb2eabbc3b36c01e81e7a46d3261e9251fef330a8311"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.4.0esr.bb
> new file mode 100644
> index 0000000..2b41312
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "ebc5c2c40cec252af6ac6c15e48f2c84"
> +SRC_URI[sha256sum] = "f518976f47472b555834208eb190cb13cc3e625a0f2784d35e1c70d58ce5d991"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.2.1esr.bb
> deleted file mode 100644
> index 3afd95c..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "ad4ad50ffb633eeaff2a51642840eeaa"
> -SRC_URI[sha256sum] = "a3665c8972749057b3cc68a7191d2b358a96ed05e9f3dd21a05fc83dc8e2559d"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.4.0esr.bb
> new file mode 100644
> index 0000000..13fef7e
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "00223fd3aa20db7e73edba8687ab79e5"
> +SRC_URI[sha256sum] = "d6735f56f2f3b590750bef3d00b9f1a9287e4c7360340406b4fd7477f79c041c"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.2.1esr.bb
> deleted file mode 100644
> index e3b1531..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "e32df30e19a4d93f9d0b59ba5090f34c"
> -SRC_URI[sha256sum] = "99abed00052cce52ddcd65a2edaa95b0311c75d3522b4784760d947ec7c2e41f"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.4.0esr.bb
> new file mode 100644
> index 0000000..54f63ac
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "a59adbc457ac79bfd633fede09d7ab4c"
> +SRC_URI[sha256sum] = "44b50cdaa3d51520fa546b3afd7fae9d872567e25344666938773b1f3e2623bb"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.2.1esr.bb
> deleted file mode 100644
> index 17b13fe..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "a4d081d68debdc63d48ad3b5ae486858"
> -SRC_URI[sha256sum] = "625db0cf3bc1b23a1fb1b49c21bfbb1671c4fea84db64ca6d0582d817efda419"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.4.0esr.bb
> new file mode 100644
> index 0000000..710858d
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "4a0b458893cd39304b5d9d05c56c767c"
> +SRC_URI[sha256sum] = "46d94a693d96f4a920aa8401a58eb6a96cff21aa9aba54fecf2c8c0987b4caa0"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.2.1esr.bb
> deleted file mode 100644
> index 6146820..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "31f5800936c2b7b1f104e5c4013bf265"
> -SRC_URI[sha256sum] = "02ac98674f658a239c264b0631d1339e8c454f444fa9261db64f250033eccfac"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.4.0esr.bb
> new file mode 100644
> index 0000000..7d493a0
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "982d6bc2038de93eeeb1be4212731556"
> +SRC_URI[sha256sum] = "e981e5a29a7fcd9752ebddb587ea57ca64d67363ab2b77d9ca477f58f8789a3c"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.2.1esr.bb
> deleted file mode 100644
> index 726fad0..0000000
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.2.1esr.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -require firefox-l10n.inc
> -
> -SRC_URI[md5sum] = "bd5474f4afe478a3ef54f0df8356c4f7"
> -SRC_URI[sha256sum] = "3fe5c8582898d0b7a030028700a58f0d7313a0c9edf88568d176175dd7c3f40c"
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.4.0esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.4.0esr.bb
> new file mode 100644
> index 0000000..547a991
> --- /dev/null
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.4.0esr.bb
> @@ -0,0 +1,7 @@
> +# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require firefox-l10n.inc
> +
> +SRC_URI[md5sum] = "d90f7c7a0068aa535824a4a23195c537"
> +SRC_URI[sha256sum] = "5f2e8226cbe93c1f7082b21725bd87ca66ebd20f2429e7c65ae43490eeb5f447"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

